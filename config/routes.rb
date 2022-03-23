Rails.application.routes.draw do
  root to: 'sessions#welcome'
  resources :users

  get 'welcome', to: 'sessions#welcome'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'authorized', to: 'sessions#page_requires_login'
  get '/sessions/new', to: 'sessions#new'
  post '/sessions/create', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/search' => 'users#search', :as => 'search_page'
 


  get 'close_contacts', to: 'close_contacts#index'
  get 'close_contacts/new', to: 'close_contacts#new'
  post 'close_contacts/new', to: 'close_contacts#create'

  resources :testforms
  resources :close_contacts

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
