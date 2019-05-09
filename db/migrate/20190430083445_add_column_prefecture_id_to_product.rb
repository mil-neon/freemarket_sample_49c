class AddColumnPrefectureIdToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :prefecture_id, :integer, null: false
  end
end
