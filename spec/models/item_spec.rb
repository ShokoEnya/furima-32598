require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品の出品' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('/sample.png')
    end

    context '商品の出品がうまくいくとき' do
      it '全ての項目が正しく入力されれば商品が出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品の出品がうまくいかないとき' do
      it '商品画像を載せないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がないと出品できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it '商品の説明がないと出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーの情報がないと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'カテゴリーの情報が空だと出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態についての情報がないと出品できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end
      it '商品の状態についての情報が空だと出品できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it '配送料の負担についての情報がないと出品できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery fee must be other than 1')
      end
      it '配送料の負担についての情報空だと出品できない' do
        @item.delivery_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it '発送元の地域についての情報がないと出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it '発送元の地域についての情報が空だと出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数についての情報がないと出品できない' do
        @item.duration_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Duration must be other than 1')
      end
      it '発送までの日数についての情報が空だと出品できない' do
        @item.duration_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Duration can't be blank")
      end
      it '価格がないと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が￥300未満だと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 300')
      end
      it '価格が￥10,000,000以上だと出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 9999999')
      end
      it '販売価格が半角英字だけだと登録できない' do
        @item.price = 'string'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '販売価格が半角英数混合だと登録できない' do
        @item.price = 'string100'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '販売価格が全角文字だと登録できない' do
        @item.price = '文字列'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
