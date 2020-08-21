Rails.application.routes.draw do
  
  resources :quotes
  resources :user_tasks

  root 'home#index'

  get 'dashboard', to: 'home#dashboard', as: 'dashboard'

  devise_for :users, :controllers => { registrations: 'registrations' }

  match 'download', to: 'home#download_pdf', as: 'download', via: :get
  
end
