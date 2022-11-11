class Address < ApplicationRecord
  
  belongs_to :customer
  
  validates :name, presence: true
  validates :address, presence: true
  validates :postal_code, length: {is: 7}
  
  def address_display
    '〒' + self.postal_code + '' + self.address + '' + self.name
  end
  
end
