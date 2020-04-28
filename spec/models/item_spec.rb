require 'rails_helper'

RSpec.describe Item, type: :model do
  it '有効なItem' do
    expect(build(:item)).to be_valid
  end
  context 'nameカラム' do
    it '40文字以下だと保存できる' do
      item = build(:item, name: "a"*40)
      expect(item).to be_valid
    end
    it '41文字以上だと保存できない' do
      item = build(:item, name: "a"*41)
      expect(item).not_to be_valid
    end
    it '0文字だと保存できない' do
      item = build(:item, name: "")
      expect(item).not_to be_valid
    end
  end
  context 'explannationカラム' do
    it '空だと保存できない' do
      item = build(:item, explannation: "")
      expect(item).not_to be_valid
    end
  end
  context 'statusカラム' do
    it '空だと保存できない' do
      item = build(:item, status: "")
      expect(item).not_to be_valid
    end
  end
  context 'shipperカラム' do
    it '空だと保存できない' do
      item = build(:item, shipper: "")
      expect(item).not_to be_valid
    end
  end
  context 'shipping_areaカラム' do
    it '空だと保存できない' do
      item = build(:item, shipping_area: "")
      expect(item).not_to be_valid
    end
  end
  context 'lead_timeカラム' do
    it '空だと保存できない' do
      item = build(:item, lead_time: "")
      expect(item).not_to be_valid
    end
  end
  context 'priceカラム' do
    it '空だと保存できない' do
      item = build(:item, price: "")
      expect(item).not_to be_valid
    end
    it '299以下だと保存できない' do
      item = build(:item, price: 299)
      expect(item).not_to be_valid
    end
    it '300だと保存できる' do
      item = build(:item, price: 300)
      expect(item).to be_valid
    end
    it '9,999,999だと保存できる' do
      item = build(:item, price: 9999999)
      expect(item).to be_valid
    end
    it '10,000,000だと保存できない' do
      item = build(:item, price: 10000000)
      expect(item).not_to be_valid
    end
    it '文字列だと保存できない' do
      item = build(:item, price: "５００")
      expect(item).not_to be_valid
    end
  end
  context 'sizeカラム' do
    it '空だと保存できない' do
      item = build(:item, size: "")
      expect(item).not_to be_valid
    end
  end
  context 'shipping_methodカラム' do
    it '空だと保存できない' do
      item = build(:item, shipping_method: "")
      expect(item).not_to be_valid
    end
  end
  context 'brand_idカラム' do
    it '空でも保存できる' do
      item = build(:item, brand_id: "")
      expect(item).to be_valid
    end
  end
  context 'user_idカラム' do
    it '空だと保存できない' do
      item = build(:item, user_id: "")
      expect(item).not_to be_valid
    end
  end
  describe 'images' do
    let!(:item) { build(:item) }
    it '画像が3枚保存されている' do
      expect{ item.save }.to change{ Image.count }.from(0).to(3)
    end
  end
end
