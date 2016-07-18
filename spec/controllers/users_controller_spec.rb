require 'rails_helper'

describe UsersController do
  let(:user) { create(:user) }
  let(:params) {{
    id: user.id,
    user: attributes_for(:user, name: 'hoge')
  }}

  describe 'with user login' do
    before { sign_in create(:user) }
    describe 'GET #show' do
      it "assigns the requested to @user" do
        get :show, id: user
        expect(assigns(:user)).to eq user
      end

      it "renders the :show template" do
        get :show, id: user
        expect(response).to render_template :show
      end
    end

    describe 'GET #edit' do
      it "assigns the requested user to @user" do
        get :edit, id: user
        expect(assigns(:user)).to eq user
      end

      it "renders the :edit template" do
        get :edit, id: user
        expect(response).to render_template :edit
      end
    end

    describe 'PATCH #update' do
      it "locates the requersted @user" do
        patch :update, params
        expect(assigns(:user)).to eq user
      end

      it "changes @user's attributes" do
        patch :update, params
        user.reload
        expect(user.name).to eq("hoge")
      end

      it "redirects to user_path" do
        patch :update, params
        expect(response).to redirect_to root_path
      end

      it "sends flash messages" do
        patch :update, params
        expect(response).to redirect_to root_path
        expect(flash[:notice]).to eq 'Edited profile successfully'
      end
    end
  end

  describe 'without user login' do
    describe 'GET #edit' do
      it "redirects sign_in page" do
        get :show, id: user
        expect(response).to redirect_to new_user_session_path
      end
    end
    describe 'PATCH #update' do
      it "redirects sign_in page" do
        patch :update, params
        user.reload
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
