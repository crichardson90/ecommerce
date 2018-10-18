Rails.application.routes.draw do
  get'/' => 'products#index'
  get '/products' => 'products#index'
  get'/products/new' => 'products#new'
  post'/products' => 'products#create'
  get '/products/:id' => 'products#show'
  get '/products/:id/edit' => 'products#edit'
  put '/products/:id' => 'products#update'
  delete '/products/:id' => 'products#destroy'

  get '/carted_products' => 'carted_products#index'
  post'/carted_products' => 'carted_products#create'
  put '/carted_products/:id' => 'carted_products#update'

  get '/orders' => 'orders#index'
  post '/orders' => 'orders#create'
  get '/orders/:id' => 'orders#show'
end