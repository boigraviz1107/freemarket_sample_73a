class Account < ApplicationRecord
  belongs_to :user
  validates :post_num, presence: true, length: { is: 7 } 
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :city_num, presence: true

end
