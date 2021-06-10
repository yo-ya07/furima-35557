# require 'rails_helper'
# describe Purchase do
#   before do
#     @purchase = FactoryBot.build(:purchase)
#   end

#   describe '商品購入機能' do
#     context '商品の出品がうまくいくとき' do # 商品出品機能のテスト
#       it '全ての項目の入力が存在すれば登録できること' do
#         expect(@purchase).to be_valid
#       end
#     end

#     context '商品の購入がうまくいかないとき' do # 商品出品機能のテスト
#       it 'nicknameが空では登録できない' do
#         @purchase.postcode = ''
#         binding.pry
#         @purchase.valid?
#         expect(@purchase.errors.full_messages).to include("Nickname can't be blank")
#       end
#     end
#   end
# end