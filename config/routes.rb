Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # We could restrict the use of Blazer to admin users only by uncommenting the next lines
  # authenticate :user, ->(user) { user.admin? } do
  mount Blazer::Engine, at: "blazer"
  # endmount Blazer::Engine, at: "blazer"

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

  get "calendar", to: "pages#calendar"

  get "landing", to: "pages#landing"
  
end
