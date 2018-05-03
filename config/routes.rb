Rails.application.routes.draw do
  get 'users/new_diver', to: 'users#new_diver', as: 'divers_reg'
  post 'users/register_diver', to: 'users#register_diver', as: 'register_diver'

  get 'users/new_skipper', to: 'users#new_skipper', as: 'skippers_reg'
  get 'users/new_instructor', to: 'users#new_instructor', as: 'instructors_reg'

  get 'home/index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"
end
