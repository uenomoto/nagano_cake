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
    
    
    #paramsメソッドで直接取得
    @order = Order.new(
      customer: current_customer,
      method_of_payment: params[:order][:method_of_payment])
      
      #残りのorder_params取得↓
       #自分の住所
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.full_name
      
      #配送先一覧の住所
    elsif params[:order][:select_address] == "1"
      #ここで配送先モデルの１つのレコードを取得↓
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
      
      #新配送先
    elsif params[:order][:select_address] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
      @new_address = "1"
    else
      render :new
    end
    
  end
  
  def create
    @order = current_customer.orders.new(order_params)
    @order.save
    
    #情報入力時新配送先が選ばれたら配送先保存↓
    if params[:order][:new_address] =="1"
      current_customer.address.create(address_params)
    end
    
    #注文商品(Order_goods)モデルにカート内商品の情報をもとに保存
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      @ordered_good = OrderedGood.new
      @ordered_good.item_id = cart_item.item_id
      @ordered_good.order_id = @order.id
      @ordered_good.amount = cart_item.amount
      @ordered_good.tax_included_price = cart_item.item.with_tax_price * cart_item.amount
      @ordered_good.save
    end
    
    #最後にカート内商品を全て削除
    @cart_items.destroy_all
    
    
    redirect_to complete_path
  end
  
  
  
  
  
  
  
  
  
  
  private
  
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :billing_amount)
  end
  
  def address_params
    params.require(:order).permit(:postal_code, :name, :address)
  end
  
end
