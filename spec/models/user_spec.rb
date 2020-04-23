require 'rails_helper'

RSpec.describe User, type: :model do
  
  it '有効なユーザー' do 
    user = build(:user)
    expect(user).to be_valid
  end
  
end
