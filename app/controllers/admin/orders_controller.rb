class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @ordered_goods = @order.ordered_goods
    @total_price = @order.billing_amount - @order.postage
  end

  def update
    @order = Order.find(params[:id])
    @order.update(status: params[:order][:status])
    redirect_to admin_order_path(@order.id)

    if @order.status == "入金確認"
      @order.ordered_goods.each do |ordered_good|
        ordered_good.update(making_status: 1)
      end
    end
  end



  private

  def order_params
    params.require(:order).permit(:address, :postal_code, :name, :billing_amount, :postage, :method_of_payment, :status, :making_status)
  end

end
