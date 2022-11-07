class Item < ApplicationRecord

  belongs_to :genre
  has_many:ordered_goods, dependent: :destroy
  has_many:cart_items, dependent: :destroy


  validates :name, presence: true
  validates :image, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :genre_id, presence: true

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


def self.search_for(word,method)
    return none if word.blank?
     if method == 'perfect'
       Item.where(name: word)

     elsif method == 'forward'
       Item.where('name LIKE ?', word + '%')

     elsif method == 'backword'
       Item.where('name LIKE ?', '%' + word)
     else
       Item.where('name LIKE ?', '%' + word + '%')
     end
end

end
