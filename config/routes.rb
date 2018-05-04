Rails.application.routes.draw do
  get 'users/new_diver', to: 'users#new_diver', as: 'divers_reg'
  post 'users/register_diver', to: 'users#register_diver', as: 'register_diver'

  get 'users/new_skipper', to: 'users#new_skipper', as: 'skippers_reg'
  get 'users/new_instructor', to: 'users#new_instructor', as: 'instructors_reg'

  get '/admins', to: 'admins#index'

  get '/admins/edit_permissions', to: 'admins#edit_permissions', as: 'edit_permissions'
  put '/admins/edit_permissions/:id', to: 'admins#update_permissions', as: 'update_permissions'

  get '/admins/edit_enablement', to: 'admins#edit_enablement', as: 'edit_enablement'
  put '/admins/update_enablement/:id', to: 'admins#update_enablement', as: 'update_enablement'

  get '/admins/edit_user_deletion', to: 'admins#edit_user_deletion', as: 'edit_user_deletion'
  delete '/admins/destroy_user/:id', to: 'admins#destroy_user', as: 'destroy_user'

  get 'home/index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"
end
