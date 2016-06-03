class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :images, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one  :main_image, -> { where(status: Image.statuses[:main]) }, class_name: "Image"
  has_many :sub_images, -> { where(status: Image.statuses[:sub]) }, class_name: "Image"

  accepts_nested_attributes_for :images, reject_if: proc { |attributes| attributes['name'].blank? }

  MAXIMUM_SUB_IMAGES_NUM = 3
  def sub_image
    sub_images = images.sub
    MAXIMUM_SUB_IMAGES_NUM.times { |i| sub_images[i] ||= images.build(status: "sub") }
    sub_images
  end

  def liked_by?(user)
    likes.find_by(user_id: user)
  end

  validates :catch_copy,
            :concept,
            :title, presence: true
end
