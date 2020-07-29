require 'rails_helper'

RSpec.describe CardsController, type: :controller do
  before do
    @user = create(:user)
  end
  describe 'GET #new' do
    context 'カード新規登録画面' do
      before do
        login_user
        get :new
      end
      it { is_expected.to render_template :new }
      end
  end

  describe 'GET #show' do
    context 'カード詳細情報画面' do
      before do
        login_user
        card = create(:card, user: @user )
        get :show, params: {  id: 1 }
      end
      it { is_expected.to render_template :show }
    end
  end
end