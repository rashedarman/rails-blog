Rails.application.routes.draw do
  get 'likes/new'
  get 'comments/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
 
  root "users#index"
  resources :users do
    resources :posts do
      resources :comments, :likes
    end
  end
end
