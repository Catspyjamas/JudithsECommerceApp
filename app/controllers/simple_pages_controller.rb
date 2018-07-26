class SimplePagesController < ApplicationController
  def index
  end

  def landing_page
    @featured_product = Product.first
    @product_aim = 3
    @random_ids = Product.ids.sort_by { rand }.slice(0, @product_aim)
    @products = Product.where(:id => @random_ids)
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    ActionMailer::Base.mail(from: @email,
        to: 'mail@judithurban.de',
        subject: "Neue Nachricht von #{@name}",
        body: @message).deliver_now
  end
end