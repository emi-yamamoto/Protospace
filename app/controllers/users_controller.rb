class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :show]

  def index
  end

  def edit
  end

  def update
    user = User.find(params[:id])
    if user.id == current_user.id
      user.update(user_params)
      redirect_to :root
    end
  end

  def show
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :member, :profile, :works)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
