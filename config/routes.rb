Rails.application.routes.draw do
  resources :appointments
  resources :service_providers
  resources :notifications
  resources :services
  resources :postings
  resources :reviews
  resources :homeowners

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

   get "search", to: "service_providers#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
