class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  # has_many :comments,dependent: :destroy
  has_many :images,dependent: :destroy
  belongs_to :brand
  belongs_to :category
  validates :user_id, :category_id, :brand_id, :name, :explannation, :status, :shipper, :shipping_area, :lead_time, :price, :size, :shipping_method, presence: true
end

