class Public::OrdersController < ApplicationController
  
  
  def new
    @customer = current_customer
    @order = Order.new
  end

  def index
  end

  def show
  end
end
