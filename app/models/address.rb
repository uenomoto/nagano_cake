class Address < ApplicationRecord
  
  belongs_to :customer
  
  validates :name, presence: true
  validates :address, presence: true
  validates :postal_code, presence: true
  
  def address_display
    '〒' + self.postal_code + '' + self.address + '' + self.name
  end
  
end
