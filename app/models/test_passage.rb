class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  # клас того объекта с которой эта ассоциация связана занывается Question и для этого укажем опцию
  # class_name: 'Question' что бы он связал ассоциацию и объект(класс-модел)
  belongs_to :current_question, class_name: 'Question', optional: true

  # вызовем хук который реализует валидацию и передадим опцию только для создания нового объекта TestPassage
  before_validation :before_validation_set_first_question, on: :create

  # назначение следующего вопроса с помощью обратного вызова
  before_update :before_update_next_question

  def completed?
  	current_question.nil?
  end

  def accept!(answer_ids)
  	if correct_answer?(answer_ids)
  	  self.correct_questions += 1
  	end

  	save!
  end

  def count_questions
    test.questions.count
  end

  def percent_result
    @correct_questions = correct_questions * 100 / count_questions
  end

  def final_result
    
  end

  private

  # при старте прохождения теста присвоить объекту класса TestPassage первый вопрос который в этом тесте содержится
  def before_validation_set_first_question
  	self.current_question = test.questions.first if test.present?
  end

  # проверим правильность ответа
  def correct_answer?(answer_ids)
  	# correct_answers_count = correct_answers.count

  	# (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
  	# correct_answers_count == answer_ids.count

    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
  	# true_answer это инициализированный нами scope или проще объект класса Proc
  	current_question.answers.true_answer
  end

  def before_update_next_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
