Rails.application.routes.draw do
  use_doorkeeper
  # Main page - placeholder
  root 'welcome#index'
  get '/secret', to: 'welcome#secret'

  # API with Grape
  mount API::Root => '/'

  # User management with Devise
  devise_for :users
end
