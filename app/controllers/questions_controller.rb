class QuestionsController < ApplicationController
  before_action :set_test, only: %i[index create delete]
  before_action :set_question, only: %i[show]

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

  def new
  	@question = Question.new
  end

  def delete
  	
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
end
