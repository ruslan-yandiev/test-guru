class ApplicationController < ActionController::Base
  # защита от пдделки POST запросов смотреть API
  protect_from_forgery with: :exception
  
  # метод класса позволяющий сделать методы экземпляра доступными как в нутри контроллеров так и в шаблонах
  helper_method :current_user, :logged_in?

  before_action :authenticate_user!

  private

  def authenticate_user!
  	# будем осуществлять перенапраяление на страницу с логином за исключением когда объект текущего пользователя найден
    unless current_user
      redirect_to login_path, alert: "Are you a Guru? Verify your Email and Password!!!"
    end

    # если пользователь будет найден то вызовем метод email, если не найден то с помощь &
    # обрабатываем эту ситуацию и присваиваем значение nil, для избежания ошибки  
    cookies[:email] = current_user&.email
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  #удобно проверить существует ли текущий пользователь или нет
  def logged_in?
    current_user.present?
  end
end
