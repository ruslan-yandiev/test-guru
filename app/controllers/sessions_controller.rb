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
  	  # флэш основан на механизме куков. Метод flash схож с хэшом
  	  # метод now позволит отобразить флэш в рамках одного запроса лишь один раз
  	  flash.now[:alert] = "Are you a Guru? Verify your Email and Password"
  	  render :new
  	end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
