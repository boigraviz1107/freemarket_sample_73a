FactoryBot.define do
  factory :image, class: Image do
    image {File.open("#{Rails.root}/public/images/pict/pict-reason-02.jpg")}
    association :item
  end
end
