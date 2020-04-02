module QuestionsHelper
  def question_header(question)
  	# # проверим новая это запись(объект)
  	# return "Create New Question in Test: #{@test.title}" if question.new_record?

  	# # проверим существует ли объект
  	# return "Edit Question in Test: #{question.test.title}" if question.persisted?
  end
end
