Rails.application.routes.draw do
<<<<<<< HEAD
  root "welcome#index"
=======
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  resources :users, only: [:new, :create]
  resources :dashboard, only: :index
>>>>>>> main
end
