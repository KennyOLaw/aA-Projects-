Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :session , only: [:create, :new, :destroy]
  
  resources :users, only: [:create, :new, :show]
  
  resources :bands do 
    resources :albums, only: [:new]
  end   

  resources :albums, only: [:show, :create, :edit, :update, :destroy]

  
  
end
