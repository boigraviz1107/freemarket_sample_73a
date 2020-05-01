class BrandsController < ApplicationController

  def index
    @brands = Brand.all
  end

  def show
    @brand = Brand.find(params[:id])
    @items = @brand.items.order(id: "ASC")
    @items = @items.page(params[:page]).per(6)
  end

end
