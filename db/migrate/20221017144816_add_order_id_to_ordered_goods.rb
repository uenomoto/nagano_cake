class AddOrderIdToOrderedGoods < ActiveRecord::Migration[6.1]
  def change
    add_column :ordered_goods, :order_id, :integer, null: false
    add_column :ordered_goods, :item_id, :integer, null: false
    add_column :ordered_goods, :amount, :integer, null: false
    add_column :ordered_goods, :tax_included_price, :integer, null: false
    add_column :ordered_goods, :making_status, :integer, null: false, default: 0
    
  end
end
