FactoryBot.define do

  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.email}
    password              {"0000000"}
    password_confirmation {"0000000"}
    last_name             {"山田"}
    first_name            {"花子"}
    last_name_kana        {"ヤマダ"}
    first_name_kana       {"ハナコ"}
    birth_year            {"2000"}
    birth_month           {"1"}
    birth_day             {"1"}
    tel_number            {"11111111111"}
  end

end