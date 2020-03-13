class QuestionsController < ApplicationController
  before_action :set_test, only: %i[index]
  before_action :set_question, only: %i[show]

  def index
  	render json: { questions: @test.questions }
  end

  def show
  	render json: { question: @question }
  end

  def create
  	
  end

  def new
  	
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
end
