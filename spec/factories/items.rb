FactoryBot.define do
  factory :item, class: Item do
    name { Faker::Name.name }
    user { FactoryBot.create(:user, nickname:"nameTest", email:"abcde@gmail.com") }
    category { FactoryBot.create :category }
    brand { FactoryBot.create :brand }
    explannation { Faker::Device.manufacturer }
    status { Faker::Device.model_name  }
    shipper { Faker::Boolean.boolean }
    shipping_area { Prefecture.find(1).name }
    lead_time { Faker::Number.between(from: 1, to: 3) }
    price { Faker::Number.between(from: 300, to: 9999999) }
    size { Faker::Military.army_rank }
    shipping_method { Faker::University.name }
    images {[
      FactoryBot.build(:image, item: nil),
      FactoryBot.build(:image, item: nil),
      FactoryBot.build(:image, item: nil),
    ]}
  end
end