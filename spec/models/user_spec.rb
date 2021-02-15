require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録' do
    context '新規登録がうまく行く時' do
    it 'nick_name,password,password_confirmation,email,last_name,first_name,last_name_kana,first_name_kana,birth_dateが存在すれば登録できる' do
      expect(@user).to be_valid
    end
  end

  context '新規登録がうまくいかない時' do
    it 'ニックネームが空では登録できない' do
      @user.nick_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nick name can't be blank")
    end
    it 'ニックネームが重複していると登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, nick_name: 'ササキさん', email: 'test@ore')
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Nick name has already been taken')
    end

    it 'emailが重複していると登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email, nick_name: 'ササキくん')
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailは＠を含む必要がある' do
      @user.email = 'samplecom'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it 'パスワードが半角英数字混合、かつ、6文字以上でないと登録できない' do
      @user.password = '11111'
      @user.password_confirmation = '11111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)',
                                                    'Password Include both letters and numbers')
    end
    it 'パスワードが全角では登録できない' do
      @user.password = 'マサヤ8571'
      @user.password_confirmation = 'マサヤ8571'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
    end
    it 'パスワードが空欄では登録できない' do
      @user.password = ''
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'パスワードが確認項目と一致しなければ登録できない' do
      @user.password_confirmation = 'Masaya857'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '生年月日が空欄では登録できない' do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
    it '苗字が空欄では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it '苗字が半角では登録できない' do
      @user.first_name = 'sasaki'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name Full-width characters')
    end
    it '名前が空欄では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it '名前が半角では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name Full-width characters')
    end
    it '苗字のふりがなが全角かなでないと登録できない' do
      @user.first_name_kana = 'ささき'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana Full-width katakana characters')
    end
    it '苗字のふりがなが空欄では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it '名前のふりがなが空欄では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it '名前のふりがなが全角かなでないと登録できない' do
      @user.last_name_kana = 'まさや'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana Full-width katakana characters')
    end
  end
end
end
