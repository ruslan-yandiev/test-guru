Rails.application.routes.draw do
  # однохренственно root to: 'tests#index'
  root 'tests#index'
 
  resources :tests do
  	resources :questions, shallow: true
  end

  # resources :account
  # get '/tests/:category/:title', to: 'tests#search', level: 2
  # get '/tests/:id/start' to: 'tests#start'
  # get '/tests/:id/start' to: 'tasks#start'
end
