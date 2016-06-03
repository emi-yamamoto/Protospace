class Prototypes::CommentsController < ApplicationController
  before_action :set_prototype, only: [:create, :destroy]

  def create
    @comment = @prototype.comments.create(comment_params)
    @comments = @prototype.comments
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @prototype, notice: 'Deleted comment successfully'
  end

  private
  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end

  def comment_params
    params.require(:comment).permit(:user_id, :prototype_id, :text)
  end
end
