FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    birth_date            {"1992-10-1"}
    email                 {"kkk@gmail.com"}
    password              {"12345678"}
    password_confirmation {"12345678"}
  end
end
