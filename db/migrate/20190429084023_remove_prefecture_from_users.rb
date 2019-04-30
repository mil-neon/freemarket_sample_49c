class RemovePrefectureFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :prefecture, :integer, null: false
    add_column :users, :prefecture_id, :integer, null: false
  end
end
