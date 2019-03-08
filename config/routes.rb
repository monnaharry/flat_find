Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:show, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :flats do
    resources :reservations, only: [:create, :new]
    resources :images, only: [:create, :index]
  end
  resources :images, only: [:destroy]
  resources :reservations, except: [:create, :new]

end


