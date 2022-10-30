class Public::OrdersController < ApplicationController
  
  
  def new
    @customer = current_customer
    @order = Order.new
  end

  def index
  end

  def show
  end
  
  def confirm
    @total_amount = 0
    @cart_items = current_customer.cart_items
    
    @order = Order.new(order_params)
       #自分の住所
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.full_name
      
      #配送先一覧の住所
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
      
      #新配送先
    elsif params[:order][:select_address] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    else
      render :new
    end
    
  end
  
  
  
  
  
  
  
  
  
  
  
  
  
  private
  
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :method_of_payment, :billing_amount)
  end
  
  def address_params
    params.require(:order).permit(:postal_code, :name, :address)
  end
  
end
