class Product < ApplicationRecord
  enum size: { "XXS以下": 1, "XS(SS)": 2, "S": 3, "M": 4, "L": 5, "XL(LL)": 6, "2XL(3L)": 7, "3XL(4L)": 8, "4XL(5L)以上": 9, "FREE SIZE": 10 }
  enum condition: { "新品、未使用": 1, "未使用に近い": 2, "目立った傷や汚れなし": 3, "やや傷や汚れあり": 4, "傷や汚れあり": 5, "全体的に状態が悪い": 6 }
  enum shipping_feeh: { "送料込み(出品者負担)": 1, "着払い(購入者負担)": 2 }
  enum shipping_method: { "未定": 1, "らくらくメルカリ便": 2, "ゆうメール": 3, "レターパック": 4, "普通郵便(定形、定形外)": 5, "クロネコヤマト": 6, "ゆうパック": 7, "クリックポスト": 8, "ゆうパケット": 9 }
  enum shipping_date: { "1~2日で発送": 1, "2~3日で発送": 2, "4~7日で発送": 3 }
  enum status: { "出品中": 1, "取引中": 2, "売却済": 3, "公開停止中": 4 }

  belongs_to :user, optional: true
  has_many :likes, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :chats, dependent: :destroy
  belongs_to :brand, optional: true
  belongs_to :category
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :name, :description, :category_id, :condition, :shipping_feeh, :shipping_method, :prefecture_id, :shipping_date, :price, :seller_id, presence: true
  validates :name, length: { maximum: 40 }
  validates :description, length: { maximum: 1000 }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: '300以上9999999以下で入力してください' }
  validates :images, length: { minimum: 1, maximum: 10}

  # scope :parent, -> (count){ Category.find(count)}
  # scope :child, -> { Category.where( parent_id: parent.id )}
  # scope :grandchild, -> { Category.where( parent_id: child.ids )}
  # scope :recent, -> { where(category_id: grandchild ).order(created_at: :DESC).limit(4)}

  scope :recent_category, lambda { |count|
    parent = Category.find(count)
    child = Category.where( parent_id: parent.id )
    grandchild = Category.where( parent_id: child.ids )
    where(category_id: grandchild ).order(created_at: :DESC).limit(4)
  }

  scope :recent_brand, lambda { |count|
    where(brand_id: count ).order(created_at: :DESC).limit(4)
  }
end
