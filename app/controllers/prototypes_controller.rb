class PrototypesController < ApplicationController

  before_action :move_to_index, except: :index
  before_action :set_prototype, only: [:edit, :show, :update, :destroy]

  def index
    @prototypes = Prototype.includes(:user, :main_image).order('created_at DESC').page(params[:page]).per(5)
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
    @sub_images = @prototype.images.sub
  end

  def edit
    @main_image = @prototype.main_image
    @sub_images = @prototype.sub_image
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to root_path, notice: 'Edited prototype successfully'
    else
      redirect_to edit_prototype_path, alert: "All forms can't be blank"
    end
  end

  def destroy
    @prototype.destroy
    redirect_to root_path, notice: 'Deleted prototype successfully'
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

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end
end
