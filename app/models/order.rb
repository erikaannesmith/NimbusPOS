class Order < ApplicationRecord
  belongs_to :service
  has_many :order_extras
  has_many :extras, through: :order_extras
end