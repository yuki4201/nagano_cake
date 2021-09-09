Rails.application.routes.draw do
  
  root to: 'users/homes#top'
  
  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
    registrations: 'admin/registrations'
  }
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  
 namespace :admin do
    
  end

  namespace :users do
    
    get '/' => 'homes#top'
    get '/about' => 'homes#about'
    get '/my_page' => 'users#show'
    patch '/my_page' => 'users#update'
    delete '/users/sign_out' => 'sessions#destroy'
    
    resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy]
    resources :plans, only: [:new, :create, :index, :show, :edit, :update, :destroy]
    
    patch '/users/plans' => 'plans#update'
    
  end
end
