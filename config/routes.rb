Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root 'items#index'
  resources :items do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  resources :cards 

  resources :cards, only: [:new, :create, :show, :destroy] 

  resources :purchases do
    collection do
      get "buy"
      post "pay"
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end