require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/test_image.png')
    end

    it "全て入力されていれば出品できること" do
      expect(@item).to be_valid
    end

    it 'ログインしているユーザーだけが出品できること' do
      @user = @user
      @item.valid?
      expect(@item).to be_valid
    end

    it 'imageが空の場合保存できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'nameが入力されていること' do
      @item.name = "文房具"
      expect(@item).to be_valid
    end
    it 'textが空ならば出品されないこと' do
      @item.text = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end
    it 'priceが空ならば出品できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it 'priceが半角数字以外だと出品できない' do
      @item.price = '３００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
    it 'priceが300円未満だと出品できないこと' do
      @item.price = 290
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end
    it 'priceが9,999,999円よりも高額だと出品できないこと' do
      @item.price = 19999999
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end
    it 'categoryが選択されていると保存できること' do
      @item.category_id = 2
      expect(@item).to be_valid
    end
    it 'statusが選択されていると保存できること' do
      @item.status_id = 3
      expect(@item).to be_valid
    end
    it 'delivery_feeが選択されてない場合出品できないこと' do
      @item.delivery_fee_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
    end
    it 'areaが選択されていいないと保存できないこと' do
      @item.area_id = 5
      expect(@item).to be_valid
    end
    describe '#days' do
        context '選択していれば商品出品できる' do
          it '保存できること' do
            @item.days_id = 3
            expect(@item).to be_valid
          end
        end

        context '選択していなければ出品できない' do
          it '保存できないこと' do
            @item.days_id = 1
            @item.valid?
            expect(@item.errors.full_messages).to include("Days must be other than 1") 
          end
        end
     end
  end
end
