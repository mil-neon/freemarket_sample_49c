class ChangeColumnToProduct < ActiveRecord::Migration[5.2]
  def up
    change_column :products, :size, :integer, null: true
    rename_column :products, :select_shipping_feeh, :shipping_feeh
  end

  def down
    change_column :products, :size, :integer, null: false
  end
end
