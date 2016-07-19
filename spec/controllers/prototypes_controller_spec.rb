require 'rails_helper'

describe PrototypesController do
   let!(:prototype) { create(:prototype, :with_sub_images) }
   let(:params) {{
     id: prototype.id,
     prototype: attributes_for(:prototype, title: 'hoge')
   }}
   let(:invalid_params) {{
     id: prototype.id,
     prototype: attributes_for(:prototype, title: nil)
   }}

  context 'with user login' do
    before { sign_in create(:user) }
    describe 'GET #index' do
      before do
        get :index
      end

      it 'assigns the requested prototypes to @prototypes' do
        prototypes = create_list(:prototype, 5)
        expect(assigns(:prototypes)).to include prototype
      end

      it 'renders the :index template' do
        expect(response).to render_template :index
      end
    end

    describe 'GET #new' do
      before do
        get :new
      end

      it 'assignes the requested prototype to @prototype' do
        expect(assigns(:prototype)).to be_a_new(Prototype)
      end

      it 'renders the :new template' do
        expect(response).to render_template :new
      end
    end

    describe 'POST #create' do
        before do
          post :create, params
        end

      context 'with valid attribtues' do
        it 'saves the new prototype in the database' do
          expect {
            post :create, params
          }.to change(Prototype, :count).by(1)
        end

        it 'redirects to root_path' do
          expect(response).to redirect_to root_path
        end

        it 'shows flash messages to show save the prototype successfully' do
          expect(flash[:notice]).to eq 'Saved prototype successfully'
        end
      end

      context 'with invalid attribtues' do
        before do
          post :create, invalid_params
        end

        it 'does not save the new prototype in the database' do
          expect {
            post :create, invalid_params
          }.not_to change(Prototype, :count)
        end

        it 'redirects new_prototype_path' do
          expect(response).to redirect_to new_prototype_path
        end

        it 'shows flash messages to show save the prototype unsuccessfully' do
          expect(flash[:alert]).to eq "All forms can't be blank"
        end
      end
    end

    describe 'GET #show' do
      before do
        get :show, id: prototype
      end

      it 'assigns the requested prototype to @prototype' do
        expect(assigns(:prototype)).to eq prototype
      end

      it 'assigns the requested comment to @comment' do
        expect(assigns(:comment)).to be_a_new(Comment)
      end

      it 'assigns like associated with prototype to @like' do
        user = prototype.user
        expect(assigns(:like)).to eq prototype.likes.find_by(user_id: user.id)
      end

      it 'renders the :show template' do
        expect(response).to render_template :show
      end
    end

    describe 'GET #edit' do
      before do
        get :edit, id: prototype
      end

      it 'assigns the requested prototype to @prototype' do
        expect(assigns(:prototype)).to eq prototype
      end

      it 'assigns main_image to @main_image' do
        expect(assigns(:main_image)).to eq prototype.main_image
      end

      it 'assigns sub_images to @sub_images' do
        expect(assigns(:sub_images)).to eq prototype.images.sub
      end

      it 'renders the :edit template' do
        expect(response).to render_template :edit
      end
    end

    describe 'PATCH #update' do
      context 'with valid attributes' do
        before do
          patch :update, params
        end

        it 'assigns the requested prototype to @prototype' do
          expect(assigns(:prototype)).to eq prototype
        end

        it 'updates attributes of prototype' do
          prototype.reload
          expect(prototype.title).to eq 'hoge'
        end

        it 'redirects to root_path'  do
          expect(response).to redirect_to root_path
        end

        it 'shows flash message to show update prototype successfully' do
          prototype.reload
          expect(flash[:notice]).to eq 'Edited prototype successfully'
        end
      end

      context 'with invalid attributes' do
        before do
          patch :update, invalid_params
        end

        it 'assigns the requested prototype to @prototype' do
          expect(assigns(:prototype)).to eq prototype
        end

        it 'does not save the new prototype' do
          prototype.reload
          expect(prototype.title).not_to eq 'hoge'
        end

        it 'renders the :edit template' do
          expect(response).to redirect_to edit_prototype_path
        end

        it 'shows flash message to show update prototype unsuccessfully' do
          prototype.reload
          expect(flash[:alert]).to eq "All forms can't be blank"
        end
      end
    end

    describe 'DELETE #destroy' do

      it 'assigns the requested prototype to @prototype' do
        delete :destroy, id: prototype
        expect(assigns(:prototype)).to eq prototype
      end

     it 'deletes the prototype' do
      expect{
        delete :destroy, id: prototype
      }.to change(Prototype, :count).by(-1)
     end

     it 'redirects to root_path' do
      delete :destroy, id: prototype
      expect(response).to redirect_to root_path
     end

     it 'shows flash message to show delete prototype successfully' do
      delete :destroy, id: prototype
      expect(flash[:notice]).to eq 'Deleted prototype successfully'
     end
    end
  end

  context 'without user login' do
    describe 'GET #new' do
      it 'redirects sign_in page' do
        get :new
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'post #create' do
      it 'redirects sign_in page' do
        post :create
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'GET #edit' do
      it 'redirects sign_in page' do
        get :edit, id: prototype.id
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'PATCH #update' do
      it 'redirects sign_in page' do
        patch :update, id: prototype
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'DELETE #destroy' do
      it 'redirects sign_in page' do
        delete :destroy, id: prototype
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
