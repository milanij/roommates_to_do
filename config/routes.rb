RoommatesToDo::Application.routes.draw do
  
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  root 'sessions#new'

  get 'users', :to => 'users#new'

  get 'sessions', :to => 'sessions#new'

  resources :lists do
    resources :items
  end



  
end
