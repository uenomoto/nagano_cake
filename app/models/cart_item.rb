class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item

  validates :amount, presence: true
  validates :customer_id, presence: true
  validates :item_id, presence: true

  # 小計
  def subtotal
      item.with_tax_price * amount
  end

end
