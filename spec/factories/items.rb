FactoryBot.define do
  factory :item do
    name            {"Tシャツ"}
    text            {"Tシャツです"}
    price           {"1000"}
    condition       {"新品、未使用"}
    category_id     {1}
    # brand_id           {"シャネル"}
    brand_id           {1}
    delivery_fee    {"出品者負担"}
    prefecture_id   {1}
    days            {"1〜2日で発送"}
    seller_id       {1}

    after(:build) do |item|
      item.images << build(:image, item: item)
    end
  end
end