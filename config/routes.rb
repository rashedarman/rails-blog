Rails.application.routes.draw do
  devise_for :users
  root "users#index"
  resources :users do
    resources :posts do
      resources :comments, :likes
    end
  end
end
