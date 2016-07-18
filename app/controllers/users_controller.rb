class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :set_user, only: [:edit, :show, :update]

  def index
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to :root, notice: 'Edited profile successfully'
  end

  def show
    @prototypes = @user.prototypes.order('created_at DESC').page(params[:page]).per(5)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :member, :profile, :works, :avatar)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
