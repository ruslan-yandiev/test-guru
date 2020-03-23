class TestPassagesController < ApplicationController

  before_action :set_test_passage, only: %i[show update result]

  # метод будет получать форму для ответа на текущий вопрос
  # отступим немного от архитектуры REST 
  def show; end

  # для показа результата прохождения теста
  def result; end

  # для сохранения факта прохождения конкретного вопроса и зваимодействия с моделью TestPassage
  # чтобы проверить верно ли ответил пользователь на вопрос или нет и если верно увеличить
  # в таблице атрибут correct_questions
  def update
    @test_passage.accept!(params[:answer_ids])
    
    if @test_passage.completed?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
