class SalesController < ApplicationController

  def index
    @sales = Sale.all
  end

  def create
    @service = Service.find(params[:service_id])
    @order = Order.find(params[:order_id])
    @sale = Sale.create(service_id: @service.id,
                        order_id: @order.id,
                        cash_handled: params[:cash_handled])
    @sale.update(date: @sale.created_at.strftime("%B %d, %Y"),
                 weekday: @sale.created_at.strftime("%A"),
                 time_spent: @order.time_difference,
                 total_bill: @order.total_bill)
    if @sale.save
      @service.open!
      flash[:success] = "Sale has successfully been recorded!"
    else
      flash[:error] = "Sale not successfully recorded."
    end

    redirect_to services_path
  end

  private

  def sales_params
    params.require(:sale).permit(:cash_handled)
  end

end
