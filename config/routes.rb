Rails.application.routes.draw do
  
  resources :quotes
  resources :user_tasks

  root 'home#index'

  get 'dashboard', to: 'home#dashboard', as: 'dashboard'

  get 'manage', to: 'user_tasks#manage', as: 'manage'

  get 'admin/quotes', to: 'quotes#admin', as: 'admin_quote'

  get 'user/quotes', to: 'quotes#user', as: 'user_quote'

  devise_for :users, :controllers => { registrations: 'registrations' }

  match 'download', to: 'home#download_pdf', as: 'download', via: :get
  
end
