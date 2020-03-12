class QuestionsController < ApplicationController
  before_action :find_test, only: :index

  def index
  	render json: { questions: @test.questions }
  end

  def show
  	
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

end
