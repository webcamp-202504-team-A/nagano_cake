class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre

  def price_with_tax
    (price_without_tax * 1.1).floor
  end

end
