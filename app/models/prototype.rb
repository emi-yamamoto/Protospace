class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :images, dependent: :destroy
  has_one :image, -> { where(status: 0) }

  accepts_nested_attributes_for :images

  validates :catch_copy,
            :concept,
            :title, presence: true
end
