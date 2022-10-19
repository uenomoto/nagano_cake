class Item < ApplicationRecord
  
  belongs_to :genre
  
  validates :name, presence: true
  validates :image, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :genre_id, presence: true
  
 has_one_attached :image
  
  def get_image(width, height)
unless profile_image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
end
  profile_image.variant(resize_to_limit: [width, height]).processed
  end
end
