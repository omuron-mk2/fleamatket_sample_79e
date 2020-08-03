require 'rails_helper'

describe Address do
  describe '#create' do
   
    it "send_last_name, send_first_name, send_last_name_kana, send_first_name_kana, postal_code, city, house_numberが存在すれば登録できること" do
      address = build(:address)
      expect(address).to be_valid
    end

    it "send_last_nameがない場合は登録できないこと" do
      address = build(:address, send_last_name: nil)
      address.valid?
      expect(address.errors[:send_last_name]).to include("を入力してください", "は不正な値です")
    end

    it "send_first_nameがない場合は登録できないこと" do
      address = build(:address, send_first_name: nil)
      address.valid?
      expect(address.errors[:send_first_name]).to include("を入力してください", "は不正な値です")
    end

    it "send_last_name_kanaがない場合は登録できないこと" do
      address = build(:address, send_last_name_kana: nil)
      address.valid?
      expect(address.errors[:send_last_name_kana]).to include("を入力してください", "は不正な値です")
    end

    it "send_first_name_kanaがない場合は登録できないこと" do
      address = build(:address, send_first_name_kana: nil)
      address.valid?
      expect(address.errors[:send_first_name_kana]).to include("を入力してください", "は不正な値です")
    end

    it "postal_codeがない場合は登録できないこと" do
      address = build(:address, postal_code: nil)
      address.valid?
      expect(address.errors[:postal_code]).to include("を入力してください", "は不正な値です")
    end

    it "house_numberがない場合は登録できないこと" do
      address = build(:address, house_number: nil)
      address.valid?
      expect(address.errors[:house_number]).to include("を入力してください")
    end

    it "room_numberがなくても登録できること" do
      address = build(:address, room_number: nil)
      expect(address).to be_valid
    end

  end
end