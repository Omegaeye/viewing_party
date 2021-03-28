Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get '/register', to: 'users#new'
  post '/login', to: 'users#login'
  post '/logout', to: 'users#logout'
  get '/dashboard', to: 'dashboard#index'
  resources :users, only: [:create]
  
  resources :friendships, only: [:create]

  resources :movies, only: [:index, :show, :create] do
    resources :viewing_party, only: [:new, :create], :controller=>"parties"
  end

  get '/discover', to: 'discover#index'
end
