class Prototypes::TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.all
  end

  def show
    @tag = ActsAsTaggableOn::Tag.find(params[:id])
    @prototypes = Prototype.tagged_with(@tag).includes(:user, :main_image).page(params[:page]).per(20)
  end
end
