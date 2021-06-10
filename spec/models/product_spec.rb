require 'rails_helper'
describe Product do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品機能' do
    context '商品の出品がうまくいくとき' do # 商品出品機能のテスト
      it '全ての項目の入力が存在すれば登録できること' do
        expect(@product).to be_valid
      end
    end

    context '商品の出品がうまくいかないとき' do # 商品出品機能のテスト
      it '商品画像を1枚つけなければ登録できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end

      it ' 商品名が空では登録できない' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end

      it ' 商品の説明が空では登録できない' do
        @product.info = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Info can't be blank")
      end

      it ' カテゴリーが「--」では登録できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Category must be other than 1')
      end

      it ' 商品の状態が「--」では登録できない' do
        @product.status_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Status must be other than 1')
      end

      it ' 配送料の負担が「--」では登録できない' do
        @product.postage_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Postage must be other than 1')
      end

      it ' 発送元の地域が「--」では登録できない' do
        @product.region_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Region must be other than 1')
      end

      it ' 発送までの日数が「--」では登録できない' do
        @product.shipping_date_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Shipping date must be other than 1')
      end

      it ' 販売価格が空では登録できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end

      it ' 販売価格が¥299以下では登録できない' do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be greater than 299')
      end

      it ' 販売価格が¥10,000,000以上では登録できない' do
        @product.price = 10_000_000
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be less than 10000000')
      end

      it ' 販売価格が全角数字では登録できない' do
        @product.price = '５０００'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not a number')
      end

      it ' 販売価格が半角英数字混合では登録できない' do
        @product.price = '50oo'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
