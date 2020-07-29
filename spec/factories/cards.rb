FactoryBot.define do

  factory :card do
    user_id { 1 }
    card_number { "MyString" }
    customer_id { "MyString" }
  end

end