class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, index: true, null: false
      t.text :description, null: false
      t.integer :size, null: false
      t.integer :condition, null: false
      t.integer :select_shipping_feeh, null: false
      t.integer :shipping_method, null: false
      t.integer :area, null: false
      t.integer :shipping_date, null: false
      t.integer :price, null: false
      t.references :seller, null: false, foreign_key: { to_table: :users }
      t.integer :buyer_id, index: true
      t.references :category, null: false, foreign_key: true
      t.references :brand, foreign_key: true
      t.integer :likes_count
      t.timestamps
    end
  end
end
