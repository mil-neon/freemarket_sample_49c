class Category < ApplicationRecord
  has_many :products
  has_many :brands, through: :brands_categories
  belongs_to :parent, class_name: :Category, optional: true
  has_many :children, class_name: :Category, foreign_key: :parent_id, dependent: :destroy, inverse_of: :category
end
