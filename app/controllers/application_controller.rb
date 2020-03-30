class ApplicationController < ActionController::Base
  # защита от пдделки POST запросов смотреть API
  protect_from_forgery with: :exception
end
