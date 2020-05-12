class Account < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user, optional: true
  validates :post_num, presence: true, length: { is: 7 }
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :city_num, presence: true
  belongs_to_active_hash :prefecture
end