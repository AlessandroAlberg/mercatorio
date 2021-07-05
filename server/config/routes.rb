Rails.application.routes.draw do

#Public
  root to: 'public#index'
  get 'public/letter'
  get 'public/search'

#Customers
  get 'account', to: 'account/access#menu'
  get 'account/access/menu'
  get 'account/access/login'
  post 'account/access/attempt_login'
  get 'account/access/logout'

  # get 'account/access/new'
  # post 'account/access/create'

  resources :account do
    resources :books, only: [:index, :show]
  end

  resources :checkout, only: [:new]
  post 'checkout/create'
  post 'rental/create'

  resources :rental_pendings

  resources :rentals

  resources :cart, only: [:index, :show] do
    member do
      get :delete
      get :add
      get :subtract
    end
  end

# User
  get 'user', to: 'user/access#menu'
  get 'user/access/menu'
  get 'user/access/login'
  post 'user/access/attempt_login'
  get 'user/access/logout'

  get 'user/books/search'
  get 'user/books/letter'

  namespace :user do
    resources :user do
      member do
        get :delete
      end    
    end

    resources :books do
      member do
        get :delete
      end
    end
  expand_path
end
