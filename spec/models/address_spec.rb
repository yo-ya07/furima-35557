require 'rails_helper'
describe PurchaseAddress do
  before do
    @address = FactoryBot.build(:purchase_address)
  end

  describe '商品購入機能' do
    context '配送先の保存がうまくいくとき' do # 商品出品機能のテスト
      it '全ての項目の入力が存在すれば登録できること' do
        expect(@address).to be_valid
      end
    end

    context '配送先の登録がうまくいかないとき' do # 商品出品機能のテスト
      it '郵便番号が空では登録できない' do
        @address.postcode = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Postcode can't be blank")
      end

      it '郵便番号にハイフンが無ければでは登録できない' do
        @address.postcode = '1234567'
        @address.valid?
        expect(@address.errors.full_messages).to include("Postcode is invalid")
      end

      it '都道府県が空では登録できない' do
        @address.region_id = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Region can't be blank")
      end

      it '市区町村が空では登録できない' do
        @address.city = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空では登録できない' do
        @address.street_address = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Street address can't be blank")
      end

      it '電話番号が空では登録できない' do
        @address.phone_number = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号は11桁以内の数値で無ければ登録できない' do
        @address.phone_number = '123456789012'
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end

  describe 'クレジット決済機能' do
    context '内容に問題ない場合' do # クレジット機能のテスト
      it 'tokenが存在すれば保存できる' do
        expect(@address).to be_valid
      end
    end

    context '内容に問題がある場合' do # クレジット機能のテスト
      it 'tokenが空では登録できない' do
        @address.token = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end