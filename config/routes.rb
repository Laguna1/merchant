Rails.application.routes.draw do
  resources :addresses
  resources :orders do 
    member do 
      get :confirm
    end
  end

  match '/auth/:provider/callback', to: 'sessions#create', via: 'get'
  match '/auth/failure', to: redirect('/'), via: 'get'
  match "/login" => redirect("/auth/twitter"), as: :login, via: :get
  match "/logout" => "sessions#destroy", as: :logout, via: :get

  resources :orders
  resources :order_items
  resources :products

  root 'products#index'
end
