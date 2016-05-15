class PrototypesController < ApplicationController

  before_action :move_to_index, except: :index

  def index
  end

  def new
    @prototype = Prototype.new

    3.times {@prototype.images.build}
  end

  def create
    Prototype.create(prototype_params)
    redirect_to action: :index
  end

  def show
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, images_attributes: [:image, :status]).merge(user_id: current_user.id)
  end
end
