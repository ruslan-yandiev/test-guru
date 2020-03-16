module ApplicationHelper
  def current_year
    "Current year: #{Time.current.year}"
  end

  def github_url(author, rep)
    "https://github.com/#{author}/#{rep}"
  end
end
