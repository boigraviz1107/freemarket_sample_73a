require 'rails_helper'

RSpec.describe User, type: :model do
  
  it '有効なユーザー' do 
    user = build(:user)
    expect(user).to be_valid
  end

  it 'nicknameが空のときは登録できない' do 
    user = build(:user, nickname: nil)
    user.valid?
    expect(user.errors[:nickname]).to include("can't be blank")
  end

  
  
  it "birth_dateがない場合は登録できないこと" do
    user = build(:user, birth_date: nil)
    user.valid?
    expect(user.errors[:birth_date]).to include("can't be blank")
  end
  
  it "first_nameがない場合は登録できないこと" do
    user = build(:user, first_name: nil)
    
    puts user.valid?
    expect(user.errors[:first_name]).to include("can't be blank")
  end
  
  it "last_nameがない場合は登録できないこと" do
    user = build(:user, last_name: nil)
    user.valid?
    expect(user.errors[:last_name]).to include("can't be blank")
  end
  
  it "first_name_hiraがない場合は登録できないこと" do
    user = build(:user, first_name_hira: nil)
    user.valid?
    expect(user.errors[:first_name_hira]).to include("can't be blank")
  end
  
  it "last_name_hiraがない場合は登録できないこと" do
    user = build(:user, last_name_hira: nil)
    user.valid?
    expect(user.errors[:last_name_hira]).to include("can't be blank")
  end
  
  describe "email" do
    it "emailがない場合は登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "emailに@がない場合は登録できないこと" do
      user = build(:user, email: "tanakagmail.com")
      expect(user).not_to be_valid
      user.valid?
      expect(user.errors[:email]).to include("is invalid")
    end

    it "emailにドメインがない場合は登録できないこと" do
      user = build(:user, email: "tanaka@")
      expect(user).not_to be_valid
      user.valid?
      expect(user.errors[:email]).to include("is invalid")
    end

    it "重複したemailが存在する場合登録できないこと" do
      user = create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end
  end

  describe "password" do
    it "passwordがない場合は登録できないこと" do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")
    end
    
    it "password_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it " passwordが7文字以上であれば登録できること " do
      user = build(:user, password: "1234567", password_confirmation: "1234567")
      user.valid?
      expect(user).to be_valid
    end

    it " passwordが6文字以下であれば登録できないこと " do
      user = build(:user, password: "123456", password_confirmation: "123456")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 7 characters)")
    end
  end
end
