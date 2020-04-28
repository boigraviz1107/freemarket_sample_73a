class Account < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user, optional: true
  validates :post_num, presence: true, length: { is: 7 } 
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :city_num, presence: true 
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  # 上記は電話番号の10桁または11桁のみ登録できるようにする正規表現です
  validates :phone_num, presence: true, format: { with: VALID_PHONE_REGEX }

  belongs_to_active_hash :prefecture
 
end