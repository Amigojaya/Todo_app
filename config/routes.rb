Rails.application.routes.draw do
  
  resources :quotes
  resources :user_tasks
  devise_for :users
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
