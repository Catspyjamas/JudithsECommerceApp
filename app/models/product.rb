

class Product < ApplicationRecord
  has_many :orders
  validates :image_url, url: true
end

