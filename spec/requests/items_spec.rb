require 'rails_helper'

RSpec.describe ItemsController, type: :request do
  let!(:user) { create(:user) }
  let(:params) { attributes_for(:item) }
  describe 'GET#new' do
    before do
      create_category
      sign_in user
      get new_item_path
    end
    it 'リクエストが成功すること' do
      expect(response.status).to eq 200
    end
    it '適切なカラム名が表示されていること' do
      expect(response.body).to include "商品名"
      expect(response.body).to include "販売手数料 (10%)"
      expect(response).to render_template 'new'
    end
    it '@itemがnewされていること' do
      expect(assigns :item).to be_a_new(Item)
    end
  end
  describe 'GET#create' do
    context '正しいparamsを送信' do
      before { sign_in user }
      it '302のレスポンスが返る' do
        post items_path, params: { item: params }
        expect(response.status).to eq 302
      end
    end
  end
end