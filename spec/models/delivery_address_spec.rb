require 'rails_helper'

RSpec.describe DeliveryAddress, type: :model do
  describe '配送先住所の保存' do
    before do
      @delivery_address = FactoryBot.build(:delivery_address)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@delivery_address).to be_valid
    end

    it 'postalが空だと保存できないこと' do
      @delivery_address.postal = nil
      @delivery_address.valid?
      expect(@delivery_address.errors.full_messages).to include("Postal can't be blank")
    end

    it 'postalが半角数字の正しい形式でないと保存出来ないこと' do
      @delivery_address.postal = '１２３−４５６７'
      @delivery_address.valid?
      expect(@delivery_address.errors.full_messages).to include('Postal Input correctly')
    end

    it 'postalが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @delivery_address.postal = '1234567'
      @delivery_address.valid?
      expect(@delivery_address.errors.full_messages).to include('Postal Input correctly')
    end

    it 'prefectures_idを選択していないと保存できないこと' do
      @delivery_address.prefectures_id = 1
      @delivery_address.valid?
      expect(@delivery_address.errors.full_messages).to include('Prefectures select')
    end

    it 'cityが空だと保存できないこと' do
      @delivery_address.city = nil
      @delivery_address.valid?
      expect(@delivery_address.errors.full_messages).to include("City can't be blank")
    end

    it 'addressが空だと保存できないこと' do
      @delivery_address.address = nil
      @delivery_address.valid?
      expect(@delivery_address.errors.full_messages).to include("Address can't be blank")
    end

    it 'buildingは空でも保存できること' do
      @delivery_address.building = nil
      expect(@delivery_address).to be_valid
    end

    it 'phoneが空だと保存できないこと' do
      @delivery_address.phone = nil
      @delivery_address.valid?
      expect(@delivery_address.errors.full_messages).to include("Phone can't be blank")
    end

    it 'phoneが半角数字の正しい形式出ない場合保存できないこと' do
      @delivery_address.phone = '０９０１２３４５６７８'
      @delivery_address.valid?
      expect(@delivery_address.errors.full_messages).to include('Phone is invalid')
    end
  end
end
