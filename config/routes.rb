Rails.application.routes.draw do

  post 'charges/create/:id', to: 'charges#create', as: 'charges_with_meetup_id'
  get 'charges/confirmation/:id', to: 'charges#confirmation', as: 'charges_confirmation'
  resources :charges, only: :new

  get 'meetups/new/:type', to: 'meetups#new', as: 'new_meetup_with_type'
  post 'meetups/join_meetup/:id', to: 'meetups#join_meetup', as: 'join_meetup'
  post 'meetups/create/:type', to: 'meetups#create', as: 'create_meetup_with_type'
  patch 'meetups/create/:id', to: 'meetups#update', as: 'patch_meetup_with_type'
  resources :meetups

  post 'comments/add_comment/:id', to: 'comments#add_comment', as: 'add_comment'
  resources :comments, defaults: { format: 'json' }

  get 'users/new_diver', to: 'users#new_diver', as: 'divers_reg'
  post 'users/register_diver', to: 'users#register_diver', as: 'register_diver'

  get 'users/new_instructor', to: 'users#new_instructor', as: 'instructors_reg'
  post 'users/register_instructor', to: 'users#register_instructor', as: 'register_instructor'

  get '/admins', to: 'admins#index'

  get '/admins/edit_permissions', to: 'admins#edit_permissions', as: 'edit_permissions'
  put '/admins/edit_permissions/:id', to: 'admins#update_permissions', as: 'update_permissions'

  get 'home/index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"
end
