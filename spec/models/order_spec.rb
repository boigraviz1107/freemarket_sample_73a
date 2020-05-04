require 'rails_helper'

RSpec.describe Order, type: :model do

  it '有効なオーダー' do 
    order = build(:order)
    expect(order).to be_valid
  end

  it "item_idがない場合は登録できないこと" do
    order = build(:order, item_id: nil)
    order.valid?
    expect(order.errors[:item_id]).to include("can't be blank")
  end

  it "user_idがない場合は登録できないこと" do
    order = build(:order, user_id: nil)
    order.valid?
    expect(order.errors[:user_id]).to include("can't be blank")
  end

  it '同じアイテムがすでにレコードにある場合に登録できない' do 
    order = create(:order)
    another_order = build(:order, user_id: "2")
    another_user.valid?
    expect(another_order.errors[:item_id]).to include("has already been taken")
    end

  
end
