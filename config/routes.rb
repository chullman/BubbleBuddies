Rails.application.routes.draw do
  get 'admins/index'
  get 'admins/edit_permissions'
  resources :meetups
  resources :certagencies
  get "home/index"
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "home#index"
end
