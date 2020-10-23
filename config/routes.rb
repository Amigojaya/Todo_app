Rails.application.routes.draw do
  
  resources :quotes
  resources :user_tasks

  delete '/user_tasks/destroy/:id', to: 'user_tasks#destroy1', as: 'destroy1'

  root 'home#index'


  get 'manage', to: 'user_tasks#manage', as: 'manage'

  get 'admin/quotes', to: 'quotes#admin', as: 'admin_quote'

  get 'user/quotes', to: 'quotes#user', as: 'user_quote'

  devise_for :users, :controllers => { registrations: 'registrations' }

  get '/email_subscribe', to: 'email_subscribes#email_subscribe_get', as: 'email_get'
  
  get '/about_me', to: 'home#about_me', as: 'about_me'
  
  get '/how_this_works', to: 'home#how_this_works', as: 'how_this_works'

  post '/email_subscribe_post', to: 'email_subscribes#email_subscribe_post', as: 'email_post'
  
end
