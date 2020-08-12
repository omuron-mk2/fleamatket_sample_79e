class ItemsController < ApplicationController
  require "payjp"
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  def index
    @items_all = Item.all.order("created_at DESC")
    @items = @items_all [0..11]
  end

  def show
    @prefecture = Prefecture.find(@item.prefecture_id).name
    @category_parent = Category.find(@item.category_id).parent.parent
    @category_child = Category.find(@item.category_id).parent
    @category_grandchild = Category.find(@item.category_id)
    @images = @item.images
    @image = @images[0]
    @brand = Brand.find(@item.brand_id).name
  end

  def edit
    @brand = Brand.find(@item.brand_id).name
    @images = @item.images
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
      flash[:notice] = '編集しました。'
    else 
      redirect_to action: "edit"
      flash[:alert] = '編集できませんでした。'
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
      flash[:notice] = '削除しました。'
    else 
      render :show, alert: "削除できませんでした。"
    end
  end

  def new
    @item = Item.new
    @item.build_brand
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
      flash[:notice] = '投稿できました。'
    else
      redirect_to action: "new"
      flash[:alert] = '入力に不備があります。'
    end
  end

  def get_category_children
    @category_children = Category.find(params[:parent_id]).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def buy
    @item = Item.find(params[:id])
    @images = @item.images
    @image = @images[0]
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
    @item = Item.find(params[:id])
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    @card = Card.find_by(user_id: current_user.id)
    charge = Payjp::Charge.create(
    amount: @item.price,
    customer: Payjp::Customer.retrieve(@card.customer_id),
    currency: 'jpy'
    )
    @buyer = Item.find(params[:id])
    @buyer.update( buyer_id: current_user.id)
  end

  def search
    @items = Item.search(params[:keyword])
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :text, :price, :condition, :delivery_fee, :days, :status, :category_id, :prefecture_id, images_attributes: [:src, :_destroy, :id],
    brand_attributes: [:id, :name]).merge(seller_id: current_user.id)
  end
end
