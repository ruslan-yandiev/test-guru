# frozen_string_literal: true

class TestsController < ApplicationController
  # authenticate_user! также реализован в devise
  before_action :authenticate_user!
  before_action :set_test, only: :start

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  # будет отвечать за начало прохождения теста
  def start
    # добавим выбранному пользователю, через вызов метода ассоциации tests и использовав метод push в его
    # спец массив(коллекцию) ActiveRecord::Associations::CollectionProxy [] выбранный тест
    current_user.tests.push(@test)
    # нужно создать в модели User метод test_passage чтобы получить не коллекцию, а конкретный объект класса TestPassage
    # перенапрявим на последний факт прохождения теста.
    redirect_to current_user.test_passage(@test)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def rescue_with_test_not_found
    render file: 'public/404.html'
  end
end
