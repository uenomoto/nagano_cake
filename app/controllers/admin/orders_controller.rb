class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  
  def show
    @customer = Customer.find(params[:id])
    @order = Order.find(params[:id])
  end
  
  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path(@order.id)
  end
  
  
  
  private
  
  def order_params
    params.require(:order).permit(:address, :postal_code, :name, :billing_amount, :postage, :method_of_payment, :status, :making_status)
  end
  
end
