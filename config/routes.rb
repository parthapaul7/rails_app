Rails.application.routes.draw do
  resources :companies
  devise_for :users
  root to: "companies#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
