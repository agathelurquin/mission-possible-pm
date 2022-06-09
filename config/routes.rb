Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :projects do
    resources :tasks, only: [ :index, :new, :create ]
  end

  resources :tasks, except: [ :index, :new, :create ]
end
