class OrderedGood < ApplicationRecord
  
   belongs_to :order
   belongs_to :item
   
   validates :order_id,           presence: true
   validates :item_id,            presence: true
   validates :amount,             presence: true
   validates :tax_included_price, presence: true
   
   #数値のみのバリデーション、この場合integerのみ
   validates :tax_included_price, :amount, numericality: { only_integer: true }
   
   enum making_status: { "製作不可": 0, "製作待ち": 1, "制作中": 2, "製作完了": 3 }
   
end
