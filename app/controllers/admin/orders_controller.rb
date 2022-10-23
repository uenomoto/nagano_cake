class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  
  def show
    # @order = Order.find(params[:id])
    @orders = Order.all
  end
  
  def update
    
  end
  
end
