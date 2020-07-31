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
      it "is expected to render template matcher show" do
        # befoerで予め指定したuserでログインする。
        login_user(@user)
        # payjpのモックを作成しpayjp_customerに代入する。
        payjp_customer = double("Payjp::Customer")
        payjp_card = double("Payjp::Card")
        # allowを用いて実際のcontrollerで記述した処理をもとにモック変数で返す。
        allow(Payjp::Customer).to receive(:retrieve).and_return(payjp_customer)
        allow(payjp_customer).to receive(:cards).and_return(payjp_card)
        # 処理の最後はtrueを返す。
        allow(payjp_card).to receive(:retrieve).and_return(true)
        # テスト環境下でカードを作る。
        card = create(:card, user: @user)
        get :show, params: { id: card}
        expect(response).to render_template :show
      end
  end      
end