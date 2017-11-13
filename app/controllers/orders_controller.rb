class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
  end

  def new
    @service = Service.find(params[:service_id])
    @order = @service.orders.new
  end

  def create
    @service = Service.find(params[:service_id])
    @order = @service.orders.create(order_params)
    if @order.save
      redirect_to service_order_path(@service, @order)
    end
  end

  private

  def order_params
    params.require(:order).permit(:start_time, :end_time)
  end

end