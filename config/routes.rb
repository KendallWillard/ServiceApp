Rails.application.routes.draw do
  resources :appointments
  resources :service_providers
  resources :notifications
  resources :services
  resources :postings
  resources :reviews
  resources :homeowners
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
