class Product < ApplicationRecord
  has_many :orders
  has_many :comments
  validates :image_url, url: true

  def highest_rating_comment
    comments.rating_desc.first
  end

  def lowest_rating_comment
    comments.rating_desc.last
  end

  def average_rating
    comments.average(:rating).to_f
  end

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
