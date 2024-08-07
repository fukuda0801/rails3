Rails.application.routes.draw do
  resources :reservations, only: [:index, :new, :create, :show, :destroy]
  post 'reservations/confirm'
  root "homes#top"
  get 'homes/show'
  devise_for :users
  resources :users, only: [:show,:edit,:update]
  resources :rooms do
    collection do 
      get 'search'
    end 
  end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
