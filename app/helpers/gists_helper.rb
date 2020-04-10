module GistsHelper
  def link_to_question(question)
    link_to truncate(question.body, length: 25), admin_question_path(question), target: '_blank'
  end

  def hash_from_url(gist)
    gist.url.split('/').last
  end
end
