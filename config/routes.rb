Rails.application.routes.draw do


  devise_for :users

  namespace :api, defaults: {format: :json} do

    resources :events, only: [:create]
  end
  

  resources :registered_applications
  resources :events



  get 'welcome/index'
  get 'welcome/about'

  
  root to: 'welcome#index'

end
