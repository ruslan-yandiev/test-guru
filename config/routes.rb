Rails.application.routes.draw do
  # однохренственно root to: 'tests#index'
  root 'tests#index'
 
  resources :tests do
  	# исключим создание маршрута index для questions
  	# с помощью shallow: true будет создан более краткий маршрут
  	resources :questions, shallow: true, except: :index do
  	  # исключим создание маршрута index для questions
  	  # с помощью shallow: true будет создан более краткий маршрут
  	  resources :answers, shallow: true, except: :index
  	end
  end

  # resources :account
  # get '/tests/:category/:title', to: 'tests#search', level: 2
  # get '/tests/:id/start' to: 'tests#start'
  # get '/tests/:id/start' to: 'tasks#start'
end
