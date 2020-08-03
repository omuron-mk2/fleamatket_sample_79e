class PurchasesController < ApplicationController
  require "payjp"

  layout 'no_header_footer'

  def buy
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
  end


end
