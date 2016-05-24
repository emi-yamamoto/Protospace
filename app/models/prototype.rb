class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :images, dependent: :destroy
  has_one  :main_image, -> { where(status: Image.statuses[:main]) }, class_name: "Image"
  has_many :sub_images, -> { where(status: Image.statuses[:sub]) }, class_name: "Image"

  accepts_nested_attributes_for :images

  validates :catch_copy,
            :concept,
            :title, presence: true
end
