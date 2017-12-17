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

<<<<<<< HEAD
  #get 'exchanges/new'
  #get 'exchanges/open'
  #get 'exchanges/close'
=======
  get 'give_aways/new'
  get 'give_aways/open'
  get 'give_aways/close'
  get 'give_aways/gift'

>>>>>>> parent of 74a52d0... Give Aways

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

<<<<<<< HEAD
  resources :exchanges

  post '/exchanges/new', to: 'exchanges#create'

=======
>>>>>>> parent of 74a52d0... Give Aways
  #root 'welcome#index'

end
