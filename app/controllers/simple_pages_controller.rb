class SimplePagesController < ApplicationController
  def index
  end

  def landing_page
    @featured_product = Product.first
    @product_aim = 3
    @products = Product.limit(@product_aim)
  end
end
