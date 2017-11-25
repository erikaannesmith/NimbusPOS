class Sale < ApplicationRecord
  belongs_to :order
  validates_uniqueness_of :order_id
end