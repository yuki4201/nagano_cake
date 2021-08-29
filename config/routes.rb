Rails.application.routes.draw do
  
  root to: 'customers/homes#top'
  
  
  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
    registrations: 'admin/registrations'
  }
  
  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    passwords: 'customers/passwords',
    registrations: 'customers/registrations'
  }
  
  namespace :admin do
    
    get '/' => 'homes#top'
    
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    
    resources :genres, only: [:index, :create, :edit, :update]
    
    resources :customers, only: [:index, :show, :edit, :update]
    
    post '/customers' => 'customers#update'
    
    patch '/customers' => 'customers#update'
    
    resources :orders, only: [:show, :update]
    
    resources :order_details, only: [:update]
  end

  namespace :customers do
    
    get '/' => 'homes#top'
    get '/about' => 'homes#about'
    get '/my_page' => 'customers#show'
    patch '/my_page' => 'customers#update'
    delete '/customers/sign_out' => 'sessions#destroy'
    
    resources :items, only: [:index, :show]
    
    resource :customers, only: [:show, :edit, :update]
    
    get '/unsubscribe' => 'customers#unsubscribe'
    get '/withdraw' => 'customers#withdraw'
    
    resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
    
    get '/cart_items' => 'customers#cart_items'
    
    resources :orders, only: [:new, :create, :index, :show]
    
    post '/orders/confirm' => 'orders#confirm'
    post '/orders/complete' => 'orders#create'
    get '/orders/complete' => 'orders#complete'
    get '/orders/:id' => 'orders#index'
    
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    patch '/my_page' => 'customers#update'
    
  end
end