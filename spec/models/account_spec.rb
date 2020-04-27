require 'rails_helper'

RSpec.describe Account, type: :model do
  describe 'account' do
    describe '#create' do
      it "post_numカラムが空白では登録できないこと" do
        account = build(:account, post_num: nil )
        account.valid?
        puts account.errors.full_messages
        expect(account.errors[:post_num]).to include("is the wrong length (should be 7 characters)")
        expect(account.errors[:post_num]).to include("can't be blank")
      end
      
      it "prefectureカラムが空白では登録できないこと" do 
        account = build(:account, prefecture: nil)
        account.valid?
        puts account.errors.full_messages
        expect(account.errors[:prefecture]).to include("can't be blank")
     end


      it " post_numが8文字以上であれば登録できないこと" do
        account = build(:account, post_num: "12345678")
        puts account.valid?
        puts account.errors.full_messages
        expect(account.errors[:post_num]).to include("is the wrong length (should be 7 characters)")
      end

      it " post_numが6文字以下であれば登録できないこと" do
        account = build(:account, post_num: "123456")
        puts account.valid?
        puts account.errors.full_messages
        expect(account.errors[:post_num]).to include("is the wrong length (should be 7 characters)")
      end

      it "post_numカラムが7文字なら登録できる" do
        user = create(:user)
        account = build(:account)
        expect(account).to be_valid
      end


      it "cityカラムが空白では登録できないこと" do 
        account = build(:account, city: nil)
        account.valid?
        puts account.errors.full_messages
        expect(account.errors[:city]).to include("can't be blank")
      end

      it "city_numカラムが空白では登録できないこと" do 
        account = build(:account, city_num: nil)
        account.valid?
        puts account.errors.full_messages
        expect(account.errors[:city_num]).to include("can't be blank")
      end

      it 'phone_numが11桁の数字の場合通過' do
        account = build(:account, phone_num: "12345678901")
        account.valid?
        expect(account).to be_valid
      end


      it 'phone_numが10桁の数字の場合通過' do
        account = build(:account, phone_num: "1234567890")
        account.valid?
        expect(account).to be_valid
      end


      it " phone_numが12文字以上であれば登録できないこと" do
        account = build(:account, phone_num: "090123456789")
        puts account.valid?
        puts account.errors.full_messages
        expect(account.errors[:phone_num]).to include("is invalid")
      end


      it " post_numが10文字以下であれば登録できないこと" do
        account = build(:account, phone_num: "090123456")
        puts account.valid?
        puts account.errors.full_messages
        expect(account.errors[:phone_num]).to include("is invalid")
      end
    end
  end
end
