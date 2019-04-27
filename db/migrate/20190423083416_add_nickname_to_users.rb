class AddNicknameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string ,null: false, index: true , unique: true
    add_column :users, :firstname_fullangle, :string, null: false
    add_column :users, :lastname_fullangle, :string, null: false
    add_column :users, :firstname_kana, :string, null: false
    add_column :users, :lastname_kana, :string, null: false
    add_column :users, :birthday, :date, null: false
    add_column :users, :postal_cord, :integer, null: false
    add_column :users, :prefecture, :integer, null: false
    add_column :users, :city, :string, null: false
    add_column :users, :address_number, :string, null: false
    add_column :users, :building_name, :string
    add_column :users, :phone_number, :integer, null: false
    add_column :users, :icon_image, :string
    add_column :users, :profile, :text
  end
end
