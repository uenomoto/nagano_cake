class CreateOrderedGoods < ActiveRecord::Migration[6.1]
  def change
    create_table :ordered_goods do |t|
      t.integer :order_id,           null: false
      t.integer :item_id,            null: false
      t.integer :amount,             null: false
      t.integer :tax_included_price, null: false
      t.integer :making_status,      null: false, default: 0
      
      t.timestamps
    end
  end
end
