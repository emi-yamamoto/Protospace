class Image < ActiveRecord::Base
  belongs_to :prototype

  enum sratus: { main: 0, sub: 1 }
end
