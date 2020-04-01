class ApplicationController < ActionController::Base
  # защита от пдделки POST запросов смотреть API
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  # # https://github.com/heartcombo/devise/wiki/How-To:-Redirect-to-a-specific-page-on-successful-sign-in,-sign-up,-or-sign-out
  def after_sign_in_path_for(user)
    if user.is_a?(Admin)
      admin_tests_path
    else
      super
    end
  end
end
