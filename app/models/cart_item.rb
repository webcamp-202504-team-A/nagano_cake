class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  validates :item_id, presence: true
  validates :amount, presence: true

  def total_cart_price
    cart_items.includes(:item).sum { |ci| ci.otem.price_with_tax * cu.amount }
  end
end
