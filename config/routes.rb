Rails.application.routes.draw do
  
  root to: 'homes#about'
  
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
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
    
    resources :orders, only: [:show, :update]
    
    resources :order_details, only: [:update]
  end

  namespace :customer do
    
    get '/' => 'homes#top'
    get '/about' => 'homes#about'
    get '/my_page' => 'customers#show'
    
    resources :items, only: [:index, :show]
    
    resources :customers, only: [:show, :edit, :update]
    
    get '/unsubscribe' => 'customers#unsubscribe'
    get '/withdraw' => 'customers#withdraw'
    
    resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
    
    resources :orders, only: [:new, :create, :index, :show]
    
    get '/orders/confirm' => 'orders#confirm'
    get '/orders/complete' => 'orders#complete'
    
    resources :address, only: [:index, :edit, :create, :update, :destroy]
  end
end