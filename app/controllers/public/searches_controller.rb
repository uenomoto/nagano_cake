class Public::SearchesController < ApplicationController

  def search
    @model = params[:model]
    @word = params[:word]
    @method = params[:method]

    if @model == 'item'
      @records = Item.search_for(@word, @method)
    end
  end

end
