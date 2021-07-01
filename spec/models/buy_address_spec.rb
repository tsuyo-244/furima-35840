require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  before do
        @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @buy_address = FactoryBot.build(:buy_address,user_id: @user.id,item_id: @item.id)
    sleep 0.1
  end

  context '内容に問題ない場合' do
    it "必須項目があれば保存ができること" do
      expect(@buy_address).to be_valid
    end
    it 'buliding_nameは空でも保存できること' do
      @buy_address.buliding = ''
      expect(@buy_address).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it "tokenが空では保存ができないこと" do
      @buy_address.token = ' '
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Token can't be blank")
    end
    it 'postal_codeが空だと保存できないこと' do
      @buy_address.postal_code = ''
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @buy_address.postal_code = '1234567'
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end
    it 'shipping_origin_idを選択していないと保存できないこと' do
      @buy_address.shipping_origin_id = 0
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Shipping origin can't be blank")
    end
    it 'cityが空だと保存できないこと' do
      @buy_address.city = ''
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("City can't be blank")
    end
    it 'addressが空だと保存できないこと' do
      @buy_address.street = ''
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Street can't be blank")
    end
    it 'phoneが空だと保存できないこと' do
      @buy_address.phone = ''
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Phone can't be blank")
    end
    it 'phoneが0桁以上11桁以内の半角数値のみ以外は保存できないこと' do
      @buy_address.phone = '080123412345'
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Phone is invalid")
    end
    it 'phoneに数字以外が混じっていた時は購入できないこと' do
      @buy_address.phone = '080aaaaaaaa'
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Phone is invalid")
    end
    it "user_id（購入者）が空だと購入できない" do
      @buy_address.user_id = ' '
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("User can't be blank")
    end
    it "item_id（購入商品）が空だと購入できない" do
      @buy_address.item_id = ' '
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Item can't be blank")
    end
  end 
end