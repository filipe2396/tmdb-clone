Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'home#index'

  devise_for :users

  get 'search(/:media_type)', to: 'searches#show', as: :search

  resources :local_movies, except: :show do
    post :favorite, on: :member
  end

  resource :favorites, only: :show
end
