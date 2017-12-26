Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'pages#index'



 

  get "/categories/:id", to: "posts#categories", as: "categories"    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts do
end
end
