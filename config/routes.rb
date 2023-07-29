Rails.application.routes.draw do
  devise_for :users
  root "users#index"
  namespace :api do
    resources :users do
      resources :posts do
        resources :comments
      end
    end
  end
end
