Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
  resources :sessions, except: [:index, :new, :destroy]
  
  resources :users, except: [:index]
end
