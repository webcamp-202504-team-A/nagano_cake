class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order

  enum production_status: {
   not_startable: 0,
   waiting: 1,
   in_production: 2,
   finished: 3,
 }

end
