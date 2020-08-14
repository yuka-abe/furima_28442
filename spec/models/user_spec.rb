require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it '全ての情報が入力されていれば保存できる' do
      expect(@user).to be_valid
    end

    it 'nicknameが存在しなければ登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordが6文字以下では登録できないこと' do
      @user.password = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordは全角では保存できないこと' do
      @user.password = 'ｕｓｅｒ１２３'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", 'Password Include both letters and numbers')
    end

    it 'passwordは半角数字だけでは保存できないこと' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", 'Password Include both letters and numbers')
    end

    it 'passwordは半角英字だけでは保存できないこと' do
      @user.password = 'userme'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", 'Password Include both letters and numbers')
    end


    it 'emailに＠がない場合は登録できないこと' do
      @user.email = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'first_nameがない場合登録できないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'Last_nameがない場合登録できないこと' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'first_name_kanaがない場合登録できないこと ' do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'last_name_kanaがない場合登録できないこと ' do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it 'first_nameは全角（漢字・ひらがな・カタカナ）で入力させること' do
      @user.first_name = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name Full_width_characters')
    end

    it 'last_nameは全角（漢字・ひらがな・カタカナ）で入力させること' do
      @user.last_name = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name Last name full_width_characters')
    end


    describe '#ゼンカク' do

      it 'first_name_kanaがカタカナでないと登録できないこと' do
      @user.first_name_kana = "ゼンカク"
      @user.valid?
      expect(@user).to be_valid('First name kana Full-width characters')
      end

      #last_name_kanaは全角カタカナでないけばならない。

      it "last_name_kanaはカタカナでなければならない" do
        @user.last_name_kana = "ゼンカク"
        @user.valid?
        expect(@user).to be_valid('Last name kana Full-width characters')
      end
    end
  

    it '生年月日がない場合登録できないこと' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

 
  end
end
