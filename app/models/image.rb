class Image < ActiveRecord::Base
  belongs_to :prototype
  mount_uploader :name, ImageUploader

  enum status: %i(main sub)

  validates :status,
            :name, presence: true
end
