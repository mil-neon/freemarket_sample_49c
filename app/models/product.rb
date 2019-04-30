class Product < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :chats, dependent: :destroy
  belongs_to :brand
  belongs_to :category
end
