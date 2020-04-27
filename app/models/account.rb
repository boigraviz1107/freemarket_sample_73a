class Account < ApplicationRecord
  belongs_to :user, optional: true
  validates :post_num, presence: true, length: { is: 7 } 
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :city_num, presence: true 
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  # 上記は電話番号の10桁または11桁のみ登録できるようにする正規表現です
  validates :phone_num, presence: true, format: { with: VALID_PHONE_REGEX }
end