class Order < ApplicationRecord
  
  belongs_to :customer
  has_many:ordered_goods, dependent: :destroy
  
  
  enum method_of_payment: { credit_card: 0, transfer: 1 }
  
  enum status: { "入金待ち": 0, "入金確認": 1, "制作中": 2, "発送準備中": 3, "発送済み": 4 }
  
  #送料
  def postage
    800
  end

#合計金額
  def total_price
       total_price = 0
       cart_items.each do |cart_item|
       total_price += cart_item.subtotal
      end
      #返り値（メソッド処理終了、式終了）
     return total_price
  end
  
  
   #請求金額
  def billing_amount
    total_price + postage
  end
end
