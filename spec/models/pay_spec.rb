require 'rails_helper'

RSpec.describe Pay, type: :model do
  it '有効なpay' do
    user = create(:user)
    pay = build(:pay, user_id: user.id)
    expect(pay).to be_valid
  end

  it 'user_idが空の場合登録できない' do
    pay = build(:pay, user_id: "")
    expect(pay).not_to be_valid
    end

  it 'customer_idが空の場合登録できない' do
    pay = build(:pay, customer_id: "")
    expect(pay).not_to be_valid
  end

  it 'card_idが空の場合登録できない' do
    pay = build(:pay, card_id: "")
    expect(pay).not_to be_valid
end

end