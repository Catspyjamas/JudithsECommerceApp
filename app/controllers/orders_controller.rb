class OrdersController < ApplicationController
  def index
    before_action :authenticate_user!
    @orders = Order.includes(:product).all
  end

  def show
    before_action :authenticate_user!
    @order = Order.find(params[:id])
  end

  def new
  end

  def create
  end

  def destroy
  end
end
