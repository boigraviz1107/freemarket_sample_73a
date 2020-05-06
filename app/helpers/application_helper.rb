module ApplicationHelper

  def now_categories_page?
    item_page = %w(categories)
    item_page.any? { |t| params[:controller].include?(t) }
  end

  def now_brands_page?
    item_page = %w(brands)
    item_page.any? { |t| params[:controller].include?(t) }
  end

  def now_users_page?
    item_page = %w(users pays)
    item_page.any? { |t| params[:controller].include?(t) }
  end

  def now_pays_page?
    item_page = %w(pays)
    item_page.any? { |t| params[:controller].include?(t) }
  end

  def now_show_page?
    item_page = %w(index)
    item_page.any? { |t| params[:action].exclude?(t) }
  end

  def now_new_page?
    item_page = %w(new)
    item_page.any? { |t| params[:action].include?(t) }
  end

end
