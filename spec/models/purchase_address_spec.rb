require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.build(:item)
    item.image = fixture_file_upload('/files/test_image.jpg')
    item.save
    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
    sleep(1)
  end

  describe '商品購入' do
    context '商品購入がうまく行く時' do
      it '全ての情報があれば購入できる' do
        expect(@purchase_address).to be_valid
      end
      it 'building_nameがなくても購入できる' do
        @purchase_address.building_name = ''
        expect(@purchase_address).to be_valid
      end
    end
    context '商品購入がうまくいかない時' do
      it 'postal_codeがなければ購入できない' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank", 'Postal code Input correctly')
      end
      it 'postal_codeを正しく記入しないと購入できない' do
        @purchase_address.postal_code = '1234-456'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code Input correctly')
      end
      it 'postal_codeは半角数字でないといけない' do
        @purchase_address.postal_code = '１２３-５６７８'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code Input correctly')
      end
      it 'postal_codeはハイフンを含まなければ登録できない' do
        @purchase_address.postal_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code Input correctly')
      end
      it '携帯番号がないと購入できない' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank",
                                                                  'Phone number Input only number')
      end
      it '携帯番号は半角数字でないと購入できない' do
        @purchase_address.phone_number = '１２３４５６７８９１２'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number Input only number')
      end
      it '携帯番号は11桁以内でなければ登録できない' do
        @purchase_address.phone_number = '1234567891234'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number Input only number')
      end
      it 'cityがないと購入できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it 'prefecture_idが1以外でなければ購入できない' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Prefecture Select')
      end
      it 'tokenがないと購入できない' do
        @purchase_address.token = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'ユーザーidが紐づいていないと購入できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it 'アイテムidが紐づいていないと購入できない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'house_numberがなければ登録できない' do
        @purchase_address.house_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
      end
    end
  end
end
