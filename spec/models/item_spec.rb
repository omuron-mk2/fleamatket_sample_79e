require 'rails_helper'
describe Item do

  describe '#create' do
    it "全ての入力条件を満たしたら登録できること" do
      user = create(:user)
      category = create(:category)
      brand = create(:brand)
      item = FactoryBot.build(:item, brand_id: brand[:id], category_id: category[:id], seller_id: user[:id])
      expect(item).to be_valid
    end

    it "商品名がない場合は登録できないこと" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "商品説明がない場合は登録できないこと" do
      item = build(:item, text: nil)
      item.valid?
      expect(item.errors[:text]).to include("を入力してください")
    end

    it "価格がない場合は登録できないこと" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end

    it "商品状態の選択がない場合は登録できないこと" do
      item = build(:item, condition: nil)
      item.valid?
      expect(item.errors[:condition]).to include("を入力してください")
    end

    it "カテゴリーの選択がない場合は登録できないこと" do
      item = build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category_id]).to include("を入力してください")
    end

    # it "ブランドがない場合でも登録できること" do
    #   item = build(:item, brand: nil)
    #   expect(item).to be_valid
    # end

    it "送料負担の選択がない場合は登録できないこと" do
      item = build(:item, delivery_fee: nil)
      item.valid?
      expect(item.errors[:delivery_fee]).to include("を入力してください")
    end

    it "配送元の選択がない場合は登録できないこと" do
      item = build(:item, prefecture_id: nil)
      item.valid?
      expect(item.errors[:prefecture_id]).to include("を入力してください")
    end

    it "配送までの日数の選択がない場合は登録できないこと" do
      item = build(:item, days: nil)
      item.valid?
      expect(item.errors[:days]).to include("を入力してください")
    end

  end

end