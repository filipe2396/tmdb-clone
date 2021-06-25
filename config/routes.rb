Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'search(/:media_type)', to: 'searches#show'

  resources :local_movies
end
