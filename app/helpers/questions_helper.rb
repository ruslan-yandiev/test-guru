module QuestionsHelper
  def question_header(question)
  	if question.body.nil?
  	  "Create New Question in Test: #{@test.title}"
  	else
  	  "Edit Question in Test: #{question.test.title}"
  	end
  end
end
