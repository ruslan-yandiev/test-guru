# frozen_string_literal: true

class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  # клас того объекта с которой эта ассоциация связана занывается Question и для этого укажем опцию
  # class_name: 'Question' что бы он связал ассоциацию и объект(класс-модел)
  belongs_to :current_question, class_name: 'Question', optional: true

  # вызовем хук который реализует валидацию и передадим опцию для создания нового объекта TestPassage
  # или назначеает следующий вопрос
  before_validation :before_validation_set_next_question
  before_update :passage_resilt!, if: :completed?
  # before_save :passage_resilt!, if: :completed? как вариант

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    save!
  end

  def count_questions
    test.questions.count
  end

  def percent_result
    correct_questions * 100 / count_questions
  end

  def passage_percent
    100 / test.questions.count * current_question_number
  end

  def current_question_number
    test.questions.where('id <= ?', current_question.id).count
  end

  def success?
    percent_result >= 85
  end

  private

  def before_validation_set_next_question
    self.current_question = if current_question
                              test.questions.order(:id).where('id > ?', current_question.id).first
                            else
                              test.questions.first
    end
  end

  # проверим правильность ответа
  def correct_answer?(answer_ids)
    correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort
  end

  def correct_answers
    # true_answer это инициализированный нами scope или проще объект класса Proc
    current_question.answers.true_answer
  end

  def passage_resilt!
    self.success = self.success?
  end
end
