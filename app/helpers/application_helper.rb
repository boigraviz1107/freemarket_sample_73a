module ApplicationHelper

  def now_categories_page?
    item_page = %w(items categories)
    item_page.any? { |t| params[:controller].include?(t) }
  end

  def now_brands_page?
    item_page = %w(brands)
    item_page.any? { |t| params[:controller].include?(t) }
  end

  def now_users_page?
    item_page = %w(users)
    item_page.any? { |t| params[:controller].include?(t) }
  end

  def now_show_page?
    item_page = %w(index)
    item_page.any? { |t| params[:action].exclude?(t) }
  end


end
