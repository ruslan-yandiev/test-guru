# frozen_string_literal: true

Rails.application.routes.draw do
  # однохренственно root 'tests#index'
  root to: 'tests#index'

  # метод отвечает за формирование всех необходимых маршрутов для devise, и переименуем URL пути
  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }, controllers: { sessions: 'users/sessions' }

  resources :feedbacks, only: %i[new create]

  resources :tests, only: :index do
    # для конкретного теста
    post :start, on: :member
  end

  # маршрут должен выглядить примерно так: GET /test_passages/101/result
  resources :test_passages, only: %i[show update] do
    # экшн(метод) result относится к конкретному ресурсу, а не коллекции
    # и по этому используем спец. метод member и передадим ему блок и получаем маршрут
    # который будет обслуживать URL: GET /test_passages/101/result
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :gists, only: %i[index destroy]

    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
