Rails.application.routes.draw do
  root 'welcome#index'
  resources :users do
    collection do
      post '/login', to: 'users#login'
    end
  end
  resources :purchases do
    collection do
      get '/finances', to: 'purchases#finances'
    end
  end
  resources :nutrients
  resources :servings
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
