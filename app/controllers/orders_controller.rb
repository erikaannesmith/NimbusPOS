class OrdersController < ApplicationController


  def new
    @service = Service.find(params[:service_id])
    @order = @service.orders.new
  end

end