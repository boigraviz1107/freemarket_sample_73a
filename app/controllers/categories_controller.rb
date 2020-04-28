class CategoriesController < ApplicationController
  
  def index
    @categories = Category.all.order("id ASC").limit(4)
  end
  
  def show
    @category = Category.find(params[:id])
    @items = []
    if @category.is_root? && @category.is_childless? # 親も子もいない子
      @items = @category.items
    elsif @category.is_root? # 親の時
      indirects = @category.indirects
      indirects.each do |indirect|
        indirect.items.each do |item|
          @items = @items.push(item)
        end
      end
    elsif @category.has_parent? && @category.has_children? # 子の時
      children = @category.children
      children.each do |child|
        child.items.each do |item|
          @items = @items.push(item)
        end
      end
    else # 孫
      @items = @category.items
    end
    # 新しい順にしたい
    # @items = @items.order(created_at: )
  end


end
