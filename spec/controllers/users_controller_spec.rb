require 'rails_helper'

describe UsersController do
  let(:user) { create(:user) }
  let(:params) {{
    id: user.id,
    user: attributes_for(:user, name: 'hoge')
  }}
  let(:invalid_params) {{
    id: user.id,
    user: attributes_for(:user, name: nil)
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
      context 'with valid attributes' do
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

      context 'with invalid attributes' do
        it "locates the requersted @user" do
          patch :update, invalid_params
          expect(assigns(:user)).to eq user
        end

        it "does not changes @user's attributes" do
          patch :update, invalid_params
          user.reload
          expect(user.name).not_to eq("hoge")
        end

        it "redirects to edit_user_path" do
          patch :update, invalid_params
          expect(response).to redirect_to edit_user_path
        end

        it 'shows flash message to show update prototype unsuccessfully' do
          patch :update, invalid_params
          user.reload
          expect(flash[:alert]).to eq "All forms can't be blank"
        end
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
