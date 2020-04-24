FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    birth_date            {"1992-10-1"}
    email                 {"kkk@gmail.com"}
    password              {"12345678"}
    password_confirmation {"12345678"}
    last_name             {"田中"}
    last_name_hira        {"たなか"}
    first_name            {"真司"}
    first_name_hira       {"しんじ"}
  end
end
