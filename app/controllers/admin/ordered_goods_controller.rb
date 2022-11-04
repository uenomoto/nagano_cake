class Admin::OrderedGoodsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @ordered_good = OrderedGood.find(params[:id])
    @ordered_good.update(ordered_good_params)
    @order = @ordered_good.order
    #同じページにリダイレクトできる
    redirect_to request.referer
    
    #ordered_goodモデルの製作ステータスが制作中になると
    if @ordered_good.making_status == "制作中"
      #orderモデルの注文ステータスが制作中に更新される
      @order.update(status: 2)
      @order.save
    end
    
    # 注文商品の個数 == 注文商品のどこの？（製作ステータス: 製作完了）になってる個数が同じなら
    if  @order.ordered_goods.count == @order.ordered_goods.where(making_status: 3).count
      # orderモデルの注文ステータスが発送準備中に更新される
      @order.update(status: 3)
      @order.save
    end

  end

  private

  def ordered_good_params
    params.require(:ordered_good).permit(:order_id, :making_status, :amount, :item_id)
  end

end
