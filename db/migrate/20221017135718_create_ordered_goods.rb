class CreateOrderedGoods < ActiveRecord::Migration[6.1]
  def change
    create_table :ordered_goods do |t|

      t.timestamps
    end
  end
end
