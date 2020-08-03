class CardsController < ApplicationController
  require "payjp"
  before_action :set_card, only: [:new, :create]
  before_action :have_card, except: [:create]

  def new
    redirect_to card_path(@credit) if @card.present?
  end

  def create
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjpToken'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
        description: 'test',
        email: current_user.email,
        card: params['payjpToken'],
        metadata: {user_id: current_user.id}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_number: customer.default_card)
      if @card.save!
        redirect_to card_path(current_user.id)
      else
        redirect_to action: "create"
      end
    end
  end

  def destroy
    if @credit.present?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@credit.customer_id)
      customer.delete
      @credit.delete
    end
      redirect_to action: "new"
  end

  def show
    if @credit.present?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@credit.customer_id)
      @default_card_information = customer.cards.retrieve(@credit.card_number)
    else
      redirect_to action: "new" 
    end
  end

  private
  def set_card
    @card = Card.find_by(user_id: current_user.id) if Card.where(user_id: current_user.id).present?
  end
  
  def have_card
    @credit = Card.find_by(user_id: current_user.id)
  end
end
