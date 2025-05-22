class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
  has_many :order_details, dependent: :destroy

  def price_with_tax
    (price_without_tax * 1.1).floor
  end

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg',content_type: 'image/jpeg')
    end
    image
  end
end
