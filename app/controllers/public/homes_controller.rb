class Public::HomesController < ApplicationController
  def top
    #新着順に並び替える↓
    @items = Item.all.order(created_at: :desc)
    @genres = Genre.all
  end

  def about
  end
end
