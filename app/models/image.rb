class Image < ActiveRecord::Base
  belongs_to :prototype

  enum status: %i(main sub)

  validates :id, presence: true
end
