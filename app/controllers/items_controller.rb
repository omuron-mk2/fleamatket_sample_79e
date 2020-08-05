class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
  end

  def show
    @item = Item.find_by(id:params[:id])
    @prefecture = Prefecture.find(@item.prefecture_id).name
    @brand = Brand.find(@item.brand_id).name
    @category_parent = Category.find(@item.category_id).parent.parent
    @category_child = Category.find(@item.category_id).parent
    @category_grandchild = Category.find(@item.category_id)
    @images = @item.images
    @image = @images[0]
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
    else
      render :new, alert: "入力に不備があります"
    end
  end

  def get_category_children
    @category_children = Category.find(params[:parent_id]).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end
  private

  def item_params
    params.require(:item).permit(:name, :text, :price, :condition, :delivery_fee, :days, :status, :category_id, :prefecture_id, images_attributes: [:src, :_destroy, :id],
    brand_attributes: [:id, :name]).merge(seller_id: current_user.id)
  end
end
