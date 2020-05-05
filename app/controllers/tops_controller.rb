class TopsController < ApplicationController
  def index
  @items = Item.all.order(id: "DESC").limit(3)
  end
end
