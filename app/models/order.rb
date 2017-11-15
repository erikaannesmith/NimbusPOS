class Order < ApplicationRecord
  belongs_to :service
  has_many :order_extras, inverse_of: :order
  has_many :extras, through: :order_extras
  accepts_nested_attributes_for :order_extras, reject_if: :all_blank, allow_destroy: true

  def time_difference
    if start_time.nil? || end_time.nil?
      0
    else
      (end_time - start_time) / 3600.to_f
    end
  end

  def total_service_cost
    service.hourly_rate * time_difference
  end

  def total_extras_cost
    if order_extras.all? { |extra| extra.quantity.nil? }
      0
    else
      order_extras.map do |extra| 
        extra.price * extra.quantity 
      end.reduce(:+)
    end
  end

  def apply_discount
    if end_time.nil? 
      1
    elsif (0..4).include?(start_time.strftime('%w').to_i)
      0.8
    else
      1
    end
  end

end