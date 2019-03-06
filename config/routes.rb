Rails.application.routes.draw do
  devise_for :users
  root to: 'flats#index'
  resources :users, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :flats do
    resources :reservations, only: [:create, :new]
    resources :images, only: [:create, :index]
  end
  resources :images, only: [:destroy]
  resources :reservations, except: [:create, :new]

end


