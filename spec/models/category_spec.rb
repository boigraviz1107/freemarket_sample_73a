require 'rails_helper'

RSpec.describe Category, type: :model do
  it '有効なcategory'do
   expect(build(:category)).to be_valid
  end
  it 'nameが空だと保存できない'do
   expect(build(:category,name:"")).not_to be_valid
  end
end
