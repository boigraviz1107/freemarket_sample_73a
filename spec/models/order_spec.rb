require 'rails_helper'

RSpec.describe Order, type: :model do

  it '有効なオーダー' do 
    item = create(:item)
    user = create(:user)
    order = build(:order, user_id: user.id, item_id: item.id)
    expect(order).to be_valid
  end

  it "item_idがない場合は登録できないこと" do
    item = create(:item)
    user = create(:user)
    order = build(:order, user_id: user.id, item_id: nil)
    order.valid?
    expect(order.errors[:item_id]).to include("can't be blank")
  end

  it "user_idがない場合は登録できないこと" do
    item = create(:item)
    user = create(:user)
    order = build(:order, user_id: nil, item_id: item.id)
    order.valid?
    expect(order.errors[:user_id]).to include("can't be blank")
  end

  it '同じアイテムがすでにレコードにある場合に登録できない' do 
    item = create(:item)
    user = create(:user)
    order = create(:order, user_id: user.id, item_id: item.id)
    another_order = build(:order, user_id: "3", item_id: item.id)
    another_order.valid?
    expect(another_order.errors[:item_id]).to include("has already been taken")
    end

end
