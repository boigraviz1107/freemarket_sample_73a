FactoryBot.define do
  factory :order do
    user_id { FactoryBot.create(:user) }
    item_id { FactoryBot.create(:item) }
  end
end
