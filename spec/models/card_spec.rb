require 'rails_helper'

RSpec.describe Card, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe '#create' do
    it "カードが登録されていること" do
      user = create(:user)
      card = Card.new(user: user, card_number: "car_a96c76b044d7ae21439d7b9840b7", customer_id: "cus_ca9d1d98900ec1f2595aebefd9a6")
      card.save
    end
  end
end