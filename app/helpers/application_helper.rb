module ApplicationHelper

  def full_title(page_title = '')
    base_title = "let:lyrics"
    if page_title.empty?
      "#{base_title} | Lyrics From New Songs, Albums, and Artists"
    else
      "#{page_title} | #{base_title}"
    end
  end

end