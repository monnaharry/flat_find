Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :flats, only: [:index, :show]
  resources :reservations, only: [:index, :show, :edit, :update, :destroy]

  resources :flats, only: [:create, :new, :edit, :update, :destroy] do
    resources :reservations, only: [:create, :new]
  end
end
