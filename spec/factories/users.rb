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
    birth_date            {"2000-01-01"}
    tel_number            {"11111111111"}
  end

end