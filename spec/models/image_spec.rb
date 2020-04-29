require 'rails_helper'

RSpec.describe Image, type: :model do
  it '有効なimage' do
    expect(build(:image)).to be_valid
  end
  it '空だと保存できない' do
    expect(build(:image, image:"")).not_to be_valid
  end

end
