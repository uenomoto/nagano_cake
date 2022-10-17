class AddItemIdToCartItems < ActiveRecord::Migration[6.1]
  def change
    add_column :cart_items, :item_id, :integer, null: false
    add_column :cart_items, :customer_id, :integer, null: false
    add_column :cart_items, :amount, :integer, null: false
    
  end
end
