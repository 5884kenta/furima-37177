require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @order = FactoryBot.build(:order_form)
  end

  describe '商品購入' do
    context '商品購入できるとき' do
      it '商品購入に必要な値が存在すれば登録できる' do
        expect(@order).to be_valid
      end
      it '建物名が無くても登録できる' do
        @order.building =""
        expect(@order).to be_valid
      end
    end

    context '商品購入できないとき' do
      it 'postal_codeが空だと保存できないこと' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'prefectureに「---」が選択されている場合は登録できない' do
        @order.prefecture_id = '1'
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it 'addressesが空だと保存できないこと' do
        @order.addresses = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Addresses can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'userが紐付いていないと保存できないこと' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
      it 'postal_codeが000-0000ハイフンがないと保存できないこと' do
        @order.postal_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'phone_numberが10桁以上11桁以内の半角数値以外だと保存できないこと' do
        @order.phone_number = '090-1234-5678'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is not a number")
      end
    end
  end

end
