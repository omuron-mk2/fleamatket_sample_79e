class PurchasesController < ApplicationController
  require "payjp"

  def buy
  #   @item = Item.find(params[:item_id])
  #   @images = @item.images.all

    if user_signed_in?
      card = Card.where(user_id: current_user.id).first
      if card.blank?
        redirect_to new_card_path
      else
        Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
        customer = Payjp::Customer.retrieve(card.customer_id)
        @default_card_information = customer.cards.retrieve(card.card_number)

      end
    else
      redirect_to user_session_path
    end
  end

  def pay
  #   @item = Item.find(params[:item_id])
  #   @images = @item.images.all
  #   if @item.purchase.present?
  #     redirect_to product_path(@product.id)
  #   else
  #     @item.with_lock do
  #       if current.user.card.present?
  #         @card = Card.find_by(user_id: current_user.id)
  #         Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
  #         charge = Payjp::Charge.creat(
  #           amount: @item.price,
  #           customer: Payjp::Customer.retrieve(@card.customer_id),
  #           currency: 'jpy'
  #         )
  #       else
  #         redirect_to new_card_path
  #         # Payjp::Charge.create(
  #         #   amount: @product.price,
  #         #   card: params['payjpToken'], 
  #         #   currency: 'jpy'
  #         # )
  #       end
  #       @purchase = Purchase.create(buyer_id: current_user.id, item_id: params[:item_id])
  #     end
  #   end
  end


end
