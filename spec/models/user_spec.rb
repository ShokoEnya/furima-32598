require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it '全ての項目が正しく入力されれば登録できること' do
      expect(@user).to be_valid
    end
    it 'ニックネームが空だと登録できないこと' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'メールアドレスが空だと登録できないこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it '重複したメールアドレスが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'メールアドレスに@を含まないと登録できないこと' do
      @user.email = 'test.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'パスワードが空だと登録できないこと' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'パスワードが6文字未満だと登録できないこと' do
      @user.password = '000aa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'パスワードが半角数字のみでは登録できないこと' do
      @user.password = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
    end
    it 'パスワードが半角英字のみでは登録できないこと' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
    end
    it 'パスワードを１回入力しただけでは登録できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'パスワードと確認パスワードが一致していないと登録できないこと' do
      @user.password = '000aaa'
      @user.password_confirmation = '0000aa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'ユーザーの本名の名字が空だと登録できないこと' do
      @user.last_name_kanji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kanji can't be blank")
    end
    it 'ユーザーの本名の名前が空だと登録できないこと' do
      @user.first_name_kanji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji can't be blank")
    end
    it 'ユーザー本名の名字は全角（漢字・ひらがな・カタカナ）以外の文字だと登録できないこと' do
      @user.last_name_kanji = 'asd123'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kanji 全角文字を使用してください')
    end
    it 'ユーザー本名の名前は全角（漢字・ひらがな・カタカナ）以外の文字だと登録できないこと' do
      @user.first_name_kanji = 'asd123'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kanji 全角文字を使用してください')
    end
    it 'ユーザー名のフリガナの名字が空だと登録できないこと' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'ユーザー名のフリガナの名前が空だと登録できないこと' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'ユーザー名のフリガナの名字が全角カタカナ以外の文字だと登録できないこと' do
      @user.last_name_kana = 'あああ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana 全角カナを使用してください')
    end
    it 'ユーザー名のフリガナの名前が全角カタカナ以外の文字だと登録できないこと' do
      @user.first_name_kana = 'あああ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana 全角カナを使用してください')
    end
    it '生年月日が空だと登録できないこと' do
      @user.date_of_birth = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Date of birth can't be blank")
    end
  end
end
