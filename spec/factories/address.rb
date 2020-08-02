FactoryBot.define do

  factory :address do
    send_last_name             {"山田"}
    send_first_name            {"花子"}
    send_last_name_kana        {"ヤマダ"}
    send_first_name_kana       {"ハナコ"}
    prefecture_id              {"1"}
    postal_code                {"1111111"}
    city                       {"札幌市"}
    house_number               {"111"}
    room_number                {"101"}
  end

end