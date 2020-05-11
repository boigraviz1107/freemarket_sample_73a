class ItemsController < ApplicationController

  before_action :set_item, only: %i(show edit update destroy)
  before_action :authenticate_user!, only: %i(new update create edit destroy)
  before_action :redirect_not_exhibitor, only: %i(edit update destroy)
  before_action :done_buy, only: %i(edit update destroy)
  before_action :set_category, only: %i(edit new)

  def show
    @previous = Item.where("id < ?", @item.id).order("id DESC").first
    @next = Item.where("id > ?", @item.id).order("id ASC").first
  end

  def new
    if session[:item]
      @brand_name = session[:item]["brand_id"].nil? ? "" : Brand.find(session[:item]["brand_id"]).name
      session[:item].clear if @item = Item.new(session[:item])
    else
      @item = Item.new
    end
    3.times { @item.images.build }
  end

  def create
    @item = Item.new(params_item)
    if @item.save
      flash[:notice] = "商品を登録しました"
      redirect_to @item
    else
      session[:item] = @item
      redirect_to new_item_path, flash: { errors: @item.errors.full_messages }
    end
  end

  def edit
    @images = @item.images.includes(:item)
    if session[:item]
      session[:item].clear if @item.attributes = session[:item]
    end
    @brand_name = @item.brand ? @item.brand.name : ""
    case @images.count
    when 1
      2.times { @item.images.build }
    when 2
      1.times { @item.images.build }
    end
  end

  def update
    if @item.update(params_item)
      redirect_to @item, flash: { notice: "商品を更新しました" }
    else
      session[:item]["category_id"] = Item.find(params[:id]).category_id
      redirect_to edit_item_path(@item), flash: { errors: @item.errors.full_messages }
    end
  end

  def destroy
      if @item.destroy
        redirect_to users_path, flash: { notice: "商品を削除しました" }
      else
        flash[:alert] = "エラーが発生しました"
        redirect_back(fallback_location: root_path)
      end
  end

  private

  def set_item
    @item = Item.find(params[:id])
    @category = @item.category
  end

  def redirect_not_exhibitor
    redirect_to root_path unless @item.user == current_user
  end

  def params_item
    check_brand_name(params)
    params.require(:item).permit(
      :category_id,
      :brand_id,
      :name,
      :explannation,
      :status,
      :shipper,
      :shipping_area,
      :lead_time,
      :price,
      :size,
      :shipping_method,
      images_attributes:[ :id, :image, :_destroy ]
    ).merge(user_id: current_user.id)
  end

  def check_brand_name(params)
    brand_name = params[:item][:brand_name]
    unless brand_name.blank?
      brand = Brand.create!(name: brand_name) unless brand = Brand.find_by(name: brand_name)
      params[:item][:brand_id] = brand.id
    else
      params[:item][:brand_id] = nil
    end
    params
  end

  def done_buy
    redirect_to item_path(@item), flash: { notice: "購入済みです" } if @item.order
  end

  def set_category
    @parents = Category.where(id: 1..4)
  end

end