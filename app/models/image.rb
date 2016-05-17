class Image < ActiveRecord::Base
  belongs_to :prototype

  enum status: %i(main sub)

  validates :status,
            :name, presence: true
end
