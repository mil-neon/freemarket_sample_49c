class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :evaluations, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :nickname, :encrypted_password, :email, :firstname_fullangle, :lastname_fullangle, :firstname_kana, :lastname_kana, :birthday, :postal_cord, :prefecture, :city, :address_number, :phone_number, presence: true
  validates :firstname_kana, :lastname_kana, format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/ }
  validates :nickname, :email, uniqueness: true
  validates :nickname, length: { maximum: 20 }
  validates :encrypted_password, length: { minimum: 6, maximum: 128 }

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :prefecture
end
