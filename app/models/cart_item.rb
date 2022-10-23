class CartItem < ApplicationRecord
  
  belongs_to :customer
  
  
  
  # 小計
  def subtotal
      item.with_tax_price * amount
  end
  
end
