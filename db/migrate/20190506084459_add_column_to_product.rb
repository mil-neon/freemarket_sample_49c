class AddColumnToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :status, :integer, null: false, default: 1
  end
end
