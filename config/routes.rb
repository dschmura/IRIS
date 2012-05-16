SampleApp::Application.routes.draw do
  
  resources :owners

  devise_for :users
  
  
  #match "/classrooms/rooms/:facility_code_heprod" => "classrooms#filter"
  #match "/classrooms/:id" => "classrooms#show"
  
  match '/classrooms/search', :to => "classrooms#search"
  resources :classrooms 

 
  resources :locations
  resources :buildings, :has_one => :location 
  
  
  


#Sign in Routes
  #resources :sessions, :only => [:new, :create, :destroy]
  #match '/signin', :to => 'sessions#new'
  #match '/signout', :to => 'sessions#destroy'
  
#Microposts Routes
  resources :microposts, :only => [:create, :destroy]
#Relationships Routes  
  resources :relationships, :only => [:create, :destroy]


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



  
  
  
#Rooms Routes

match '/classrooms', :to => 'rooms#classrooms'  
  
  

end
