class BrandsController < ApplicationController

  def index
    @brands = Brand.all
  end

  def show
    @brand = Brand.find(params[:id])
    @items = @brand.items.order(id: "DESC")
  end

end
