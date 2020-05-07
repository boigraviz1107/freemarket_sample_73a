class BrandsController < ApplicationController

  def index
    @brands = Brand.all
    @root_categories = Category.where(ancestry: nil)
    @category_brands = []
    for i in 0..(@root_categories.count-1)
      @category_brands << search_brand(@root_categories[i])
    end
  end

  def show
    @brand = Brand.find(params[:id])
    @items = @brand.items.order(id: "ASC").page(params[:page]).per(6)
  end

  def root_category_brand_item
    @category = Category.find(params[:category_id])
    @brand = Brand.find(params[:id])
    items = []
    @category.indirects.each do |child|
      child.items.each { |item| items << item if item.brand == @brand }
    end
    @items = Kaminari.paginate_array(items).page(params[:page]).per(6)
  end

  private

  def search_brand(root_category)
    array = []
    @brands.each do |brand|
      brand.categories.each { |cate| array << brand if cate.root == root_category }
    end
    array.uniq
  end

end
