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

    # для конкретного теста 
    member do
      post :start
    end
  end

  # маршрут должен выглядить примерно так: GET /test_passages/101/result
  resources :test_passages, only: %i[show update] do
    # экшн(метод) result относится к конкретному ресурсу, а не коллекции
    # и по этому используем спец. метод member и передадим ему блок и получаем маршрут
    # который будет обслуживать URL: GET /test_passages/101/result
    member do
      get :result
    end
  end

  # resources :account
  # get '/tests/:category/:title', to: 'tests#search', level: 2
  # get '/tests/:id/start' to: 'tests#start'
  # get '/tests/:id/start' to: 'tasks#start'
end
