Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
    get '/users/resistrations/:id', to: 'users/registrations#show'
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
    get 'users/addresses/:id/edit', to: 'users/registrations#edit_address'
    patch 'users/addresses/:id', to: 'users/registrations#update_address'
  end
  root 'items#index'
  resources :items do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  resources :cards 

  resources :users, only: [:show, :create, :edit, :update]
  get '/users/:id/exhibition', to: 'users#exhibition'
  get '/users/:id/purchase', to: 'users#purchase'

  resources :cards, only: [:new, :create, :show, :destroy] 

  resources :purchases do
    collection do
      get "buy"
      post "pay"
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :details, only: :show 
end