Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :organisms, only: [:index, :show] do
    resources :infections, only: [:new, :create]
  end

  resources :infections, only: [:index]
  patch '/infections/:id', to: 'infections#cancel', as: :cancel_infection
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
