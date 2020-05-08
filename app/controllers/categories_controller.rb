class CategoriesController < ApplicationController

  def index
    @categories = Category.all.order("id ASC").limit(4)
  end

  def show
    @category = Category.find(params[:id])
    @items = []
    if @category.is_root? && @category.is_childless? # 親も子もいない子
      @items = @category.items.page(params[:page]).per(10)
    elsif @category.is_root? # 親の時
      indirects = @category.indirects
      indirects.each do |indirect|
        indirect.items.each do |item|
          @items.push(item)
        end
      end
      @items = Kaminari.paginate_array(@items).page(params[:page]).per(10)
    elsif @category.has_parent? && @category.has_children? # 子の時
      children = @category.children
      children.each do |child|
        child.items.each do |item|
          @items = @items.push(item)
        end
      end
      @items = Kaminari.paginate_array(@items).page(params[:page]).per(10)
    else
      @items = @category.items.page(params[:page]).per(10)
    end
  end

  def root_parent_category
    @root_parent = Category.find(params[:id]).root
    @parent = Category.find(params[:id]).parent 
    respond_to(&:json)
  end

  def parents
    @parents = Category.where(ancestry: nil)
    respond_to(&:json)
  end

  def children
    @children = Category.find(params[:id]).children
    respond_to(&:json)
  end

end