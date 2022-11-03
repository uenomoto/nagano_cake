class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    #↓合計金額初期値は０円
    @total_amount = 0
    #allにするとログインしてる人以外のcart_itemsがショッピングカートに入ってきちゃう where文で指定してあげる
    @cart_items = CartItem.where(customer:current_customer)
  end
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @exist_cart_item = CartItem.find_by(item: @cart_item.item)
    if @exist_cart_item.present?
      @cart_item.amount += @exist_cart_item.amount
      @exist_cart_item.destroy
    end
      @cart_item.save
      redirect_to cart_items_path
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(amount: params[:cart_item][:amount].to_i)
    @cart_item.save
    redirect_to cart_items_path
  end
  
  
  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end
  
  
   private
   
  def cart_item_params
      params.require(:cart_item).permit(:customer_id, :item_id, :amount)
  end
  
end

