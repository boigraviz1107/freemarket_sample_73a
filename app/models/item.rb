class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to :brand, optional: true
  belongs_to :category
  validates :user_id, :category_id, :name, :explannation, :status, :shipping_area, :lead_time, :price, :size, :shipping_method, presence: true
  validates :shipper, inclusion: { in: [true, false] }
  validates :name,    length: { maximum: 40 }
  validates :price, numericality: { only_integer: true, greater_than:	299, less_than: 10000000 }
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  validates_associated :images
  validates :images, presence: true

  def how_many_lead_time?
    ['1~2日で発送', '2~3日で発送', '4~7日で発送'][self.lead_time]
  end

  def which_shipper?
    self.shipper ? "送料込み(出品者負担)" : "着払い(購入者負担)"
  end

end