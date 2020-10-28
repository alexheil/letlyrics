module ApplicationHelper

  def full_title(page_title = '')
    base_title = "Default Skin"
    if page_title.empty?
      "#{base_title} | Your Boilerplate Setup"
    else
      "#{page_title} | #{base_title}"
    end
  end

end
