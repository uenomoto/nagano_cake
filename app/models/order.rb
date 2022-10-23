class Order < ApplicationRecord
  
  belongs_to :customer
  has_many:ordered_goods, dependent: :destroy
  
  
  enum method_of_payment: { credit_card: 0, transfer: 1 }
  
  enum status: { "入金待ち": 0, "入金確認": 1, "制作中": 2, "発送準備中": 3, "発送済み": 4 }
  
end
