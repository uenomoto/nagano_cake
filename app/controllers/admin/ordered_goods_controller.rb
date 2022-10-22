class Admin::OrderedGoodsController < ApplicationController
  
  belongs_to :item
  belongs_to :order
  
end
