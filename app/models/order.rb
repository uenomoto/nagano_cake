class Order < ApplicationRecord
  
  belongs_to :customer
  has_many:ordered_goods, dependent: :destroy
  
  validates :name,              presence: true
  validates :address,           presence: true
  validates :postal_code,       length: {is: 7}
  validates :customer_id,       presence: true
  validates :billing_amount,    presence: true
  validates :postage,           presence: true
  validates :method_of_payment, presence: true
  
  validates :postage, :billing_amount, numericality: { only_integer: true }
  
  enum method_of_payment: { credit_card: 0, transfer: 1 }
  
  enum status: { "入金待ち": 0, "入金確認": 1, "制作中": 2, "発送準備中": 3, "発送済み": 4 }
  
  
 #送料 
def postage
  800
end
  

end
