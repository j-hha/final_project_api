Rails.application.routes.draw do
  resources :consumptions
  resources :purchase_pounds
  resources :purchase_cups
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
