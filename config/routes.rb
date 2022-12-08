Rails.application.routes.draw do
  get 'movies/show'
  get 'movies/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "lists#index"
  resources :lists do
    resources :bookmarks
  end

  resources :movies
end
