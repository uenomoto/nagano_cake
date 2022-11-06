class Public::ItemsController < ApplicationController


  def index
    #商品が8個で１ページ↓
    @items = Item.all.page(params[:page]).per(8)
    @items_total = Item.all
    @genres = Genre.all
  end
  
  #ジャンル別一覧
  def type_item
    @genre = Genre.find(params[:id])
    @genres = Genre.all
    @items_total = @genre.items.all
  end


  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new
  end

  private

  def item_params
      params.require(:item).permit(:genre_id, :name, :introduction, :price, :is_active, :image)
  end


end
