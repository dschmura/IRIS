Iris::Application.routes.draw do
  
  resources :owners
  devise_for :users
  
  resources :classrooms do
    get :search, :on => :collection
  end
  
  resources :locations
  resources :buildings, :has_one => :location 
  
#Sign in Routes
  resources :sessions, :only => [:new, :create, :destroy]
  match '/signin', :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
  
#Pages Routes
  root :to => "pages#home"

  match '/contact', :to => 'pages#contact'
  match '/about',   :to => 'pages#about'
  match '/help',    :to => 'pages#help'
  match '/signup',  :to => 'users#new'

  match '/development', :to => 'pages#development'
  match '/room', :to => 'pages#room'
  match '/faq', :to => 'pages#faq'
  match '/events', :to => 'pages#event_support'
  match '/admin', :to => 'pages#admin'
   

end
