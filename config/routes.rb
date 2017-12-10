Rails.application.routes.draw do
  get 'give_aways/new'

  get 'give_aways/open'

  get 'give_aways/close'

  get 'give_aways/gift'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #root 'welcome#index'

end
