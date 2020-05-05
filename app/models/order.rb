class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates :user_id, :item_id, presence: true
  validates :item_id, uniqueness: true
end
