class ItemsController < ApplicationController
  require "payjp"


  def index
  end

  def buy
    # 購入する商品を引っ張ってきます。
    # @item = item.find(params[:item_id])
    # itemの持つたくさんのimagesの中から最初のものだけとる(書き方あってる？)。
    # @images = @product.images.first
    if user_signed_in?
      card = Card.find_by(user_id: current_user.id)
      if card.present?
        Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
        customer = Payjp::Customer.retrieve(card.customer_id)
        @default_card_information = customer.cards.retrieve(card.card_number)
      else
        redirect_to new_card_path
      end
    else
      redirect_to user_session_path
    end
  end

  def pay
    # @item = Item.find(params[:item_id]) <= "どのitemを買うのかidで指定する,buyもなのでbefore_actionする"
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    @card = Card.find_by(user_id: current_user.id)
    charge = Payjp::Charge.create(
    # amount: @item.price, <= "itemsの値段"
    amount: 500,
    customer: Payjp::Customer.retrieve(@card.customer_id),
    currency: 'jpy'
    )
  end

  private

  def item_params
    params.require(:item).permit(
      :name,
      :text,
      :price,
    ).merge(user_id: current_user.id)
  end

end
