Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :organisms, only: [:index, :show] do
    resources :infections, only: [:new, :create, :edit, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
