Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get '/register', to: 'users#new'
  post '/login', to: 'users#login'
  resources :users, only: [:new, :create]
  resources :dashboard, only: :index

end
