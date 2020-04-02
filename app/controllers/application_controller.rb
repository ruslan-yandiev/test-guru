class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  # защита от пдделки POST запросов смотреть API
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  before_action :set_locale

  protected

  # # https://github.com/heartcombo/devise/wiki/How-To:-Redirect-to-a-specific-page-on-successful-sign-in,-sign-up,-or-sign-out
  def after_sign_in_path_for(user)
    if user.admin?
      admin_tests_path
    else
      super
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password, :current_password)}
  end

  # как вариант
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password])
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email, :password])
  # end

  def default_url_options
    { locale: I18n.locale }
  end

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end
