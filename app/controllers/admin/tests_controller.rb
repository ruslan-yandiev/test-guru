# frozen_string_literal: true

class Admin::TestsController < Admin::BaseController
  before_action :set_tests, only: %i[index update_inline]

  before_action :set_test, only: %i[show edit update destroy start update_inline]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index; end

  def show; end

  def new
    # создадим экземпляр не сохраняя его в базу
    @test = Test.new
  end

  def edit; end

  def create
    @test = current_user.authored_tests.new(test_params)

    # Если объект успешно сохранен в базу то перенаправить на отображение объекта
    if @test.save
      redirect_to admin_test_path(@test), notice: t('.success')
      # redirect_to [:admin, @test], notice: t('.success')
    else
      # указываем, что мы хотим отрендерить шаблон связанный с методо new и сделать только это
      # то есть код самого метода new выполняться не будет!!!
      # А так как экземпляр при вызове экшена create уже создан, нам будет, что рендерить.
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test)
    else
      render :edit
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def destroy
    # destroy удалит объект из БД, но объект в оперативной памяти останется
    # и мы можем обратиться к нему к примеру, чтобы отобразить какой тест удален
    @test.destroy
    redirect_to admin_tests_path
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def set_tests
    @tests = Test.all
  end

  # стронг параметры, для защиты. Рельсы обязуют.
  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def rescue_with_test_not_found
    render file: 'public/404.html'
  end
end
