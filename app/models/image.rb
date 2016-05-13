class Image < ActiveRecord::Base
  belongs_to :prototype

  enum status: { main: 0, sub: 1 }
end
