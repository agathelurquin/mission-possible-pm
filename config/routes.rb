Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :projects do
    resources :tasks
  end

  resources :assignments, only: [:new, :create]
end
