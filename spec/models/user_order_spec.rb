require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    @user_order = FactoryBot.build(:user_order)
  end

  describe "商品の購入" do
    context "商品の購入がうまくいくとき" do
      it "全ての項目が正しく入力されたら商品が購入できる" do
        expect(@user_order).to be_valid
      end
    end
    context "商品の購入がうまくいかないとき" do
      it "tokenが空だと購入できない" do
        @user_order.token = ""
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Token can't be blank")
      end
      it "郵便番号がないと購入できない" do
        @user_order.post_code = ""
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Post code can't be blank")
      end
      it "郵便番号にハイフンが含まれないと購入できない" do
        @user_order.post_code = "0000000"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Post code is invalid. Include hyphen(-).")
      end
      it "都道府県名がないと購入できない" do
        @user_order.prefecture_id = ""
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "都道府県名が選択されていないと購入できない" do
        @user_order.prefecture_id = "1"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Prefecture needs to be selected")
      end
      it "市区町村名がないと購入できない" do
        @user_order.city = ""
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("City can't be blank")
      end
      it "番地がないと購入できない" do
        @user_order.addresses = ""
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Addresses can't be blank")
      end
      it "電話番号がないと購入できない" do
        @user_order.phone_no = ""
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone no can't be blank")
      end
      it "電話番号にハイフンが含まれていると購入できない" do
        @user_order.phone_no = "090-0000-0000"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone no is invalid. Input only half-width numbers.")
      end
      it "電話番号に英字が含まれると購入できない" do
        @user_order.phone_no = "0900000asd"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone no is invalid. Input only half-width numbers.")
      end
      it "電話番号が11桁以上だと購入できない" do
        @user_order.phone_no = "090000000000"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone no is too long (maximum is 11 characters)")
      end
      it "電話番号が全角数字だと購入できない" do
        @user_order.phone_no = "０９０００００００００"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone no is invalid. Input only half-width numbers.")
      end
    end
  end
end
