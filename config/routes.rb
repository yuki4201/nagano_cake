Rails.application.routes.draw do
  
  devise_for :admin, controllers: {
    sessions: 'admin/sessions'
  }
  
  devise_for :customers, controllers: {
    sessions: 'customers/sessions'
  }
  
  namespace :admin do
    
    get '/' => 'homes#top'
    get '/about' => 'homes#about'
    
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    
    resources :genres, only: [:index, :create, :edit, :update]
    
    resources :customers, only: [:index, :show, :edit, :update]
    
    resources :orders
    
    resources :order_details, only: [:update]
  end

  namespace :customers do
    
    resources :sessions, only: [:new, :create, :destroy]
    
    get '/' => 'homes#top'
    get '/about' => 'homes#about'
    
    resources :items, only: [:index, :show]
    
    resources :registrations, only: [:new, :create]
    
    resources :customers, only: [:show, :edit, :update, :unsubscribe, :withdraw]
    
    resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
    
    resources :orders, only: [:new, :confilm, :complete, :create, :index, :show]
    
    resources :order_details, only: [:index, :edit, :create,:update, :destroy]
  end
end
