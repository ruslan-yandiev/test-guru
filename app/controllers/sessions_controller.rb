class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:email])

  	# с помощью & построим логику, что если мы пользователя не найдем по email
  	# то в переменной user будет значение nil и за счет & все выражение user&.authenticate(params[:password])
  	# тоже вычеслится в nil и мы уйдем в ветку else
  	if user&.authenticate(params[:password])
  	  # метод для работы с пользовательскими сессиями, похож на хэш, а значит можем присваивать значение ключу
  	  session[:user_id] = user.id
  	  redirect_to tests_path
  	  # с помощью метода session мы в дальнейшем сможем проверить есть ли у нас идентификатор пользователя в сессии в куки 
  	  # и понять можем ли мы идентифицировать пользователя или нет.
  	else
  	  render :new
  	end
  end
end
