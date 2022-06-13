Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :projects do
    resources :tasks, only: [:index, :new, :create, :edit, :update]
    resources :files, only: :destroy
  end

  resources :tasks, only: [:show, :destroy] do
    resources :assignments, only: [:create, :destroy]
  end

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
end
