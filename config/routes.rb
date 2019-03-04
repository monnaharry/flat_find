Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :flats, only: [:index, :show]

  resources :users do
    resources :reservations, only: [:edit, :update, :destroy]
    resources :flats, only: [:create, :new, :edit, :update, :destroy] do
      resources :reservations, only: [:create, :new]
    end
  end
end
