class Public::CartItemsController < ApplicationController
  
  
  def index
  end
  
  def create
     binding.pry
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @item = Item.find(cart_item_params[:item_id])
    @item.save
    redirect_to cart_items_path
  end
  
  
  
   private
   
  def cart_item_params
      params.require(:cart_item).permit(:customer_id, :item_id, :amount)
  end
  
end
