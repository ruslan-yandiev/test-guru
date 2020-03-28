module ApplicationHelper
  def current_year
    "Current year: #{Time.current.year}"
  end

  def github_url(author, rep)
    "https://github.com/#{author}/#{rep}"
  end

  def flash_massage(type)
    content_tag(:p, flash[type], class: "flash #{type}") if flash[type] 
  end
end
