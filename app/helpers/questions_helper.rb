module QuestionsHelper
  def question_header(question)
  	return "Create New Question in Test: #{@test.title}" if question.new_record?

  	return "Edit Question in Test: #{question.test.title}" if question.persisted?
  end
end
