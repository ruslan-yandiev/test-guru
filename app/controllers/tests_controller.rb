class TestsController < ApplicationController
  def index
  	# Верхняя нужна, чтобы колбэк выполнялся только в родительском классе, а в дочерних не выполнялся, 
  	# это если колбэки помещены в родительский класс ApplicationController
  	# skip_before_action :find_test, only: :show

  	# before_action :fild_test

  	# after_action :send_log_message

  	# around_action :log_execute_time




  	# result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]

  	# render plain: result.join("\n")



  	# вернет нам простую строку при plain: '....'
  	# render plain: 'All tests'

  	#метод html_safe покажет, что строка безопасна и ее ненужно экранировать и можно инторпретировать в браузере html разметку.
  	# render html: '<h1>All tests</h1>'.html_safe

  	# позволит нам отрендерить данные в формате json
  	# render json: { tests: [] }
  	# render json: { tests: Test.all }

  	# inline: позволяет нам смесь html и ruby кода, за это отвечает библиотека erb
  	# render inline: '<p>My favourite language is: <%= %[ybuR].reverse! %>!</p>'

  	# опция позволяет отрендерить и вернуть в браузер статический файл
  	# вторым аргументом можем передать layout: false для того, чтобы не рендерить layout по умолчанию
  	# render file: 'public/hello', layout: false

  	# порой бывает необходимо не рендерить тело сообщения, а просто вернуть код статуса ответа и заголовок и больше ничего не делать.
  	# head 204

  	# rails предлагает удобную систему соглашений по которой вместо кода ответа мы можем передать символ который инторпретирует 204
  	# head :no_content

  	# с помощью гема(входит в поставку с rails) можно вызвать дебагер.
  	# пауза произойдет в том месте где вызван метод byebug и в консоле в логе сервера будет загружена irb консоль
  	# byebug

  	# еще один способ поставить точку остановки, вызовет консоль в браузере.
  	# полноценная консоль в браузере )) рельс консоль
  	# render inline: '<%= console %>'

  	# вернет нам какую то отладочную информацию с конкритезацией какую инфу info(self.object_id)
  	# инфа пишется не только в консоль но и в спец файл /log/development.log
  	# logger.info(self.object_id)

  	# из архитектыры REST, наш ресурс, наш ответ может быть отрендерен в различных форматах (Это все логика представления)
  	# и с помощью блока вернуть ответ в зависимости от того в каком формате он запрашивается
  	# по дефолту вернет в формате html, но при запросе на пример из браузера :3000/tests.json вернет в формате json
  	# respond_to do |format|
  	# 	format.html { render plain: 'All tests' }
  	# 	format.json { render json: { tests: Test.all } }
  	# end
  end

  # # отвечает за отображение конкретного теста в нашем случае
  # def show

  # 	# перенапрявляет наш запрос на любой указанный путь и адрес
  # 	# redirect_to 'https://yandex.ru'
  # 	# можем использовать хелпер root_path, для вывода на корневую страницу созданный при создании маршрутов http://localhost:3000/tests/1
  # 	redirect_to root_path
  # end

  # def search
  # 	result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]

  # 	render plain: result.join("\n")
  # end

  # def new
  # 	# params[:controller]
  # 	# controller_name
  # 	# action_name
  # end

  # def create
  # 	# result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]

  # 	# render plain: result.join("\n")

  # 	test = Test.create(test_params)

  # 	render plain: test.inspect
  # end

  # # def start
  # # 	render plain: 'Start certain test'
  # # end

  # private

  # def test_params
  # 	params.require(:test).permit(:title, :level)
  # end
end
