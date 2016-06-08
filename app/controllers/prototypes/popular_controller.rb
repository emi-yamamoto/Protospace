class Prototypes::PopularController < ApplicationController
  def index
    @prototypes = Prototype.includes(:user, :main_image).order('like_count DESC').page(params[:page]).per(5)
  end
end
