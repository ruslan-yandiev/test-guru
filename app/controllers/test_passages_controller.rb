class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  # метод будет получать форму для ответа на текущий вопрос
  # отступим немного от архитектуры REST 
  def show; end

  # для показа результата прохождения теста
  def result; end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call
    
    if result.success?
      Gist.create(
        question: @test_passage.current_question,
        url: result[:html_url],
        user: current_user
      )

      flash[:notice] = t('.success', url: result[:html_url])
    else
      flash[:alert] = t('.failure')
    end

    redirect_to @test_passage
  end

  # для сохранения факта прохождения конкретного вопроса и зваимодействия с моделью TestPassage
  # чтобы проверить верно ли ответил пользователь на вопрос или нет и если верно увеличить
  # в таблице атрибут correct_questions
  def update
    @test_passage.accept!(params[:answer_ids])
    
    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
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
