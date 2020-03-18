class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  # клас того объекта с которой эта ассоциация связана занывается Question и для этого укажем опцию
  # class_name: 'Question' что бы он связал ассоциацию и объект(класс-модел)
  belongs_to :current_question, class_name: 'Question', optional: true

  # сделаем валидацию которая будет проверять и устанавливать значение текущего вопроса
  before_validation :before_validation_set_first_question, on: :create

  private

  def before_validation_set_first_question
  	self.current_question = test.questions.first if test.present?
  end
end
