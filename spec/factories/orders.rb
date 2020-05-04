FactoryBot.define do
  factory :order do
    user_id { FactoryBot.create(:user) }
    item_id { FactoryBot.create(:item) }
    # user_id { 1 }
    # item_id { 1 }
    # association :item, :user
  end
end
