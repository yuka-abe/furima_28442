require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nicknameが存在しなければ登録できないこと" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "passwordが6文字以上であれば登録できること" do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      expect(@user).to be_valid
    end

    it "パスワードは半角英数混合であること" do
      @user.password = "123abc"
      @user.password_confirmation = "123abc"
      @user.valid?
      expect(@user).to be_valid
    end

    it "emailが一意性であること" do
      user = @user
      another_user = @user.email
    end

    it "emailに＠がない場合は登録できないこと" do
      @user.email = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "first_nameがない場合登録できないこと" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "Last_nameがない場合登録できないこと" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "first_name_kanaがない場合登録できないこと " do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it "last_name_kanaがない場合登録できないこと " do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

 #first_name_kanaはかたかなでないけばならない。
    describe '#ぜんかく' do

      it "first_nameは全角でなければならないこと" do
      @user.first_name = "ぜんかく"
      @user.valid?
      expect(@user).to be_valid("First name  Full-width characters")
      end

      it "last_nameは全角でなければならにこと" do
      @user.last_name = "ぜんかく"
      @user.valid?
      expect(@user).to be_valid("Last name  Full-width characters")
      end
    end

    #first_name_kanaは全角カタカナでないけばならない。
    describe '#ゼンカクカナ' do

      it "first_name_kanaはカタカナでなければならない" do
      @user.first_name_kana = "ゼンカクカナ"
      @user.valid?
      expect(@user).to be_valid("First name kana Full-width katakana characters")
      end

     #last_name_kanaは全角カタカナでないけばならない。
    
      it "last_name_kanaはカタカナでなければならない" do
      @user.last_name_kana = "ゼンカクカナ"
      @user.valid?
      expect(@user).to be_valid("Last name kana Full-width katakana characters")
      end
    end

    it "生年月日がない場合登録できないこと" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end