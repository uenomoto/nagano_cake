class AddNameToGenres < ActiveRecord::Migration[6.1]
  def change
    add_column :genres, :name, :string, null: false
  end
end
