class Admin::OrderedGoodsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @ordered_good = OrderedGood.find(params[:id])
    @ordered_good.update(ordered_good_params)
    @order = @ordered_good.order
    redirect_to admin_order_path(@order.id)
  end


  private

  def ordered_good_params
    params.require(:ordered_good).permit(:order_id, :making_status, :amount, :item_id)
  end

end
