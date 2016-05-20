class PrototypesController < ApplicationController

  before_action :move_to_index, except: :index

  def index
  end

  def new
    @prototype = Prototype.new
    @prototype.images.build
  end

  def create
    @prototype = Prototype.new(prototype_params)

    if @prototype.save
      redirect_to root_path, notice: 'Saved prototype successfully'
    else
      redirect_to new_prototype_path, alert: "All forms can't be blank"
    end
  end

  def show
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  private
  def prototype_params
    params.require(:prototype).permit(
      :title,
      :catch_copy,
      :concept,
      :user_id,
      images_attributes: [:id, :name, :status]
    )
  end
end
