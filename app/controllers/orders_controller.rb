class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @sale = @order.sale || @order.build_sale
  end

  def new
    @service = Service.find(params[:service_id])
    @order = @service.orders.new
    @extras = Extra.all

    @extras.each do |extra|
      case extra.extra_type
      when 'snack' then @order.snack_order_extras.build(extra: extra)
      when 'drink' then @order.drink_order_extras.build(extra: extra)
      end
    end

    render 'new', layout: params[:no_layout].blank?
  end

  def create
    @service = Service.find(params[:service_id])
    @order = @service.orders.create(order_params)
    @order.open!
    @service.occupied!
    @order.order_extras.each do |f|
      f.price = Extra.find(f.extra_id).price
    end
    @order.save!

    redirect_to service_order_path(@service, @order)
  end

  def edit
    @service = Service.find(params[:service_id])
    @order = @service.orders.find(params[:id])

    render 'edit', layout: params[:no_layout].blank?
  end

  def update
    service = Service.find(params[:service_id])
    order = service.orders.find(params[:id])
    order.update(order_params)

    redirect_to service_order_path(service, order)
  end

  def destroy
    @order = Order.find(params[:id])
    @order.order_extras.delete_all
    @order.destroy
    @order.service.open!
    flash[:info] = "Order has been cancelled"
    redirect_to services_path
  end

  private

  def order_params
    params.require(:order).permit(
      :start_time,
      :end_time,
      :previous_cost,
      snack_order_extras_attributes: [:id, :quantity, :extra_id, :_destroy],
      drink_order_extras_attributes: [:id, :quantity, :extra_id, :_destroy],
    )
  end

end
