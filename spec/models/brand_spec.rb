require 'rails_helper'

RSpec.describe Brand, type: :model do
  it '有効なbrand' do
    expect(build(:brand)).to be_valid
  end
  it 'nameが空だと保存できない' do
    expect(build(:brand, name:"")).not_to be_valid
  end
end
