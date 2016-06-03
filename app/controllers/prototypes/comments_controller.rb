class Prototypes::CommentsController < ApplicationController
  before_action :set_prototype, only: [:create, :destroy]

  def create
  end

  def destroy
  end

  private
  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end
end
