class Item < ApplicationRecord

  belongs_to :genre
  has_many:ordered_goods, dependent: :destroy
  has_many:cart_items, dependent: :destroy


  validates :name,         presence: true
  validates :image,        presence: true
  validates :introduction, length: { minimum: 5 }
  validates :price,        numericality: { only_integer: true }
  validates :genre_id,     presence: true


 has_one_attached :image

  def get_image(width, height)
unless image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
   image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
end
  image.variant(resize_to_limit: [width, height]).processed
  end


  #税込価格
 def with_tax_price
  (price * 1.1).floor
 end

#サーチ機能↓
def self.search_for(word,method)
    return none if word.blank?
    #完全一致
     if method == 'perfect'
       Item.where(name: word)
    #前方一致
     elsif method == 'forward'
       Item.where('name LIKE ?', word + '%')
    #後方一致
     elsif method == 'backword'
       Item.where('name LIKE ?', '%' + word)
    #部分一致
     else
       Item.where('name LIKE ?', '%' + word + '%')
     end
end

end
