Iris::Application.routes.draw do

  resources :room_attributes do
      collection {post :import}
  end


  resources :room_schedule_contacts do
      collection {post :import}
  end


  # Rewrite from old site
  match 'detail.php', :to => 'old_site_redirector#detail'
  match 'index.php', :to => 'old_site_redirector#pages'
  
  resources :owners
  devise_for :users
  
  resources :users
  
  resources :classrooms do
    get :search, :on => :collection
    collection {post :import}
  end
  
  resources :locations
  resources :buildings, :has_one => :location 
  
#Sign in Routes
  #resources :sessions, :only => [:new, :create, :destroy]
  #match '/signin', :to => 'sessions#new'
  #match '/signout', :to => 'sessions#destroy'
  
#Pages Routes
  root :to => "pages#home"

  match '/contact', :to => 'pages#contact'
  match '/about',   :to => 'pages#about'
  match '/about_iss',   :to => 'pages#about_iss'
  match '/help',    :to => 'pages#support'
  match '/support',    :to => 'pages#support'
  match '/privacy', :to => 'pages#privacy_policy'
  match '/iss_support',    :to => 'pages#iss_support'
  match '/signup',  :to => 'users#new'

  match '/development', :to => 'pages#development'
  match '/room', :to => 'pages#room'
  match '/faq', :to => 'pages#faq'
  match '/events', :to => 'pages#event_support'
  match '/admin', :to => 'pages#admin'
  
   

end
