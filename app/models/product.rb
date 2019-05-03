class Product < ApplicationRecord
  belongs_to :user, optional: true
  has_many :likes, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :chats, dependent: :destroy
  belongs_to :brand, optional: true
  belongs_to :category

  validates :name, :description, :category_id, :condition, :shipping_feeh, :shipping_method, :prefecture_id, :shipping_date, :price, :seller_id, presence: true
  validates :name, length: { maximum: 40 }
  validates :description, length: { maximum: 1000 }
  validates :price,numericality: { greater_than_or_equal_to: 300, 
                                   less_than_or_equal_to: 9_999_999, 
                                   message: '300以上9999999以下で入力してください' }
end
