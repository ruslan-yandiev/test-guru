class QuestionsController < ApplicationController
  before_action :set_test, only: %i[index create new]
  before_action :set_question, only: %i[show destroy edit]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found



  def index
  	render json: { questions: @test.questions }
  end

  def show
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

  def edit
  end

  def destroy
    redirect_to @question.test if @question.destroy
  end

  private

  def set_test
  	@test = Test.find(params[:test_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def rescue_with_question_not_found
    render plain: 'Question not found'
  end
end
