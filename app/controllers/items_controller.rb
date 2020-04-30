class ItemsController < ApplicationController
  before_action :set_item, only: %i(show edit update destroy)
  before_action :authenticate_user!, only: %i(new update create edit destroy)
  before_action :has_user?, only: %i(edit update destroy)

  def index
    @items = Item.all.order(created_at: "DESC")
  end

  def show
  end

  def new
    @item = Item.new
    @item.images.build 
    @item.images.build 
    @item.images.build 
  end

  def create
    @item = Item.new(params_item)
    unless @item.images.present?
      @item.valid?
      redirect_to new_item_path, flash: { error: @item.errors.full_messages.push("There are no images") }
      return false
    end
    if @item.save
      flash[:notice] = "商品を登録しました"
      redirect_to @item
    else
      redirect_to new_item_path, flash: { error: @item.errors.full_messages }
    end
  end

  def edit
  end

  def update
    if @item.update(params_item)
      flash[:notice] = "商品を更新しました"
      redirect_to @item
    else
      render 'edit'
    end
  end

  def destroy
    if @item.destroy
      flash[:notice] = "商品を削除しました"
      # redirect_to user_path #users#showができていればこちらに
      redirect_to root_path
    else
      flash[:alert] = "エラーが発生しました"
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def has_user?
    redirect_to root_path unless @item.user_id == current_user.id
  end

  def params_item
    check_brand_name(params)
    params.require(:item).permit(:category_id, :brand_id, :name, :explannation, :status, :shipper, :shipping_area, :lead_time, :price, :size, :shipping_method, images_attributes:[ :id, :image, :_destroy ]).merge(user_id: current_user.id)
  end

  def check_brand_name(params)
    brand_name = params[:item][:brand_name]
    unless brand_name.blank?
      unless brand = Brand.find_by(name: brand_name)
        brand = Brand.create!(name: brand_name)
      end
      params[:item][:brand_id] = brand.id
    else
      params[:item][:brand_id] = nil
    end
    return params
  end
end
