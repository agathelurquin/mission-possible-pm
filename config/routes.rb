Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :projects do
    resources :tasks, only: [:index, :new, :create]
  end

  resources :tasks, only: [:show, :edit, :update, :destroy] do
    resources :assignments, only: [:create]
  end

end
