class TestsController < ApplicationController
  before_action :set_test, only: %i[show edit update destroy start]
  before_action :set_user, only: :start

  def index
    @tests = Test.all
  end

  def show; end

  def new
    # создадим экземпляр не сохраняя его в базу
    @test = Test.new
  end

  def edit; end

  def create
    # создадим экземпляр не сохраняя его в базу и с передачей стронг параметров.
  	@test = Test.new(test_params)

    # Если объект успешно сохранен в базу то перенаправить на отображение объекта
    if @test.save
      redirect_to @test
    else
      # указываем, что мы хотим отрендерить шаблон связанный с методо new и сделать только это
      # то есть код самого метода new выполняться не будет!!!
      # А так как экземпляр при вызове экшена create уже создан, нам будет, что рендерить. 
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    # destroy удалит объект из БД, но объект в оперативной памяти останется 
    # и мы можем обратиться к нему к примеру, чтобы отобразить какой тест удален
    @test.destroy
    redirect_to tests_path
  end

  # будет отвечать за начало прохождения теста
  def start
    # добавим выбранному пользователю, через вызов метода ассоциации tests и использовав метод push в его
    # спец массив(коллекцию) ActiveRecord::Associations::CollectionProxy [] выбранный тест
    @user.tests.push(@test)
    # нужно создать в модели User метод test_passage чтобы получить не коллекцию, а конкретный объект класса TestPassage
    # перенапрявим на последний факт прохождения теста.
    redirect_to @user.test_passage(@test)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def set_user
    # возьмем первого из базы пока нет системы регистрации пользователя.
    @user = User.first
  end

  # стронг параметры, для защиты. Рельсы обязуют.
  def test_params
  	params.require(:test).permit(:title, :level, :category_id)
  end
end
