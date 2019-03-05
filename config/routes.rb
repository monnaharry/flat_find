Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :flats do
    resources :reservations, only: [:create, :new]
    resources :pictures, only: [:create, :destroy]
  end
  resources :reservations, except: [:create, :new]

end


