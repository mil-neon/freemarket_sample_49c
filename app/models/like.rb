class Like < ApplicationRecord
  validates :product_id, presence: true
  validates :user_id, presence: true
end
