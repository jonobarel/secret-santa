Rails.application.routes.draw do


  root 'static_pages#home'
  
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get 'exchanges/open', to: 'exchanges#open'
  get 'exchanges/close', to: 'exchanges#close'
  #get 'exchanges/participating/:id', to: 'exchanges#participating'

  resources :users
  resources :participations

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :exchanges do
    member do
      get :participating
      post :assign
    end
  end


  post '/exchanges/new', to: 'exchanges#create'

  #root 'welcome#index'

end
