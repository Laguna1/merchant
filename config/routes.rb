Rails.application.routes.draw do
  match '/auth/:provider/callback', to: 'sessions#create', via: 'get'
  match '/auth/failure', to: redirect('/'), via: 'get'
  
  resources :orders
  resources :order_items
  resources :products
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
