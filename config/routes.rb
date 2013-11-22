Iris::Application.routes.draw do

  resources :room_attributes do
      collection {post :import}
  end


  resources :room_schedule_contacts do
      collection {post :import}
  end


  # Rewrite from old site
  match 'detail.php', :to => 'old_site_redirector#detail', via: :get
  match 'index.php', :to => 'old_site_redirector#pages', via: :get
  
  resources :owners
  devise_for :users
  
  resources :users
  
  resources :classrooms do
    resources :seating, except: :index
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

  match '/contact', :to => 'pages#contact', via: :get
  match '/about',   :to => 'pages#about', via: :get
  match '/about_iss',   :to => 'pages#about_iss', via: :get
  match '/help',    :to => 'pages#support', via: :get
  match '/support',    :to => 'pages#support', via: :get
  match '/privacy', :to => 'pages#privacy_policy', via: :get
  match '/iss_support',    :to => 'pages#iss_support', via: :get
  match '/signup',  :to => 'users#new', via: :get

  match '/development', :to => 'pages#development', via: :get
  match '/room', :to => 'pages#room', via: :get
  match '/faq', :to => 'pages#faq', via: :get
  match '/events', :to => 'pages#event_support', via: :get
  match '/admin', :to => 'pages#admin', via: :get
  #match '/dentistry', :to => 'pages#dentistry'
  
  match '/classrooms/:id/seating', :to => 'classrooms#seating', via: :get
  
  #match '/dentistry' => redirect("http://rooms.lsa.umich.edu/classrooms?utf8=✓&q%5BDEPT_GRP_eq%5D=SCHOOL_DENTISTRY")
  #match '/dentistry', :to => redirect("http://localhost:3000/classrooms?utf8=✓&search%5BDEPT_GRP_equals%5D=SCHOOL_DENTISTRY"), :as => :dentistry


end
