class OrderDetail < ApplicationRecord
  belogs_to :item
  belongs_to :order
end
