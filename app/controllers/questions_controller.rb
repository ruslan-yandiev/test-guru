class QuestionsController < ApplicationController
  before_action :set_test, only: %i[index create]
  before_action :set_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found



  def index
  	render json: { questions: @test.questions }
  end

  def show
  	render json: { question: @question }
  end

  def create
    if @test.questions.create(question_params)
      redirect_to test_questions_path
    else
      render :new
    end
  end

  def new; end

  def destroy
  	if questions.delete
      render Question.all.each.with_index { |i, q| "#{i}) #{q}" }
    else
      render plain: 'Что-то не так!'
    end
  end

  private

  def set_test
  	@test = Test.find(params[:test_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question not found'
  end
end
