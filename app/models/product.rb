class Product < ApplicationRecord
  has_many :orders
  validates :image_url, url: true

  if ENV['RAILS_ENV'] == "development" then
    def self.search(search_term)
      Product.where("name LIKE ?", "%#{search_term}%")
    end
  elsif ENV['RAILS_ENV'] == "production" then
    def self.search(search_term)
      Product.where('name ilike ?', "%#{search_term}%")
    end
  end
end
