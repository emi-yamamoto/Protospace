class LikesController < ApplicationController

  before_action :set_prototype, only: [:create, :destroy]

  def create
    @like = @prototype.likes.create(user_id: current_user.id)
    @likes = @prototype.likes
  end

  def destroy
    @prototype.likes.find_by(user_id: current_user.id).destroy
    @likes = @prototype.likes
    @prototype = Prototype.find(params[:prototype_id])
  end

  private
  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end
end
