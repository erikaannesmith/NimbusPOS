class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
  end

  def new
    @service = Service.find(params[:service_id])
    @order = @service.orders.new
    # @extras_snacks = Extra.where(extra_type: "snack")
    # @extras_drinks = Extra.where(extra_type: "drink")
  end

  def create
    @service = Service.find(params[:service_id])
    @order = @service.orders.create(order_params)
    @order.save
    @service.occupied!

    redirect_to service_order_path(@service, @order)
  end

  private

  def order_params
    params.require(:order).permit(:start_time, :end_time)
  end

end