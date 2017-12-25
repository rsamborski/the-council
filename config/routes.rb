Rails.application.routes.draw do
  # Main page - placeholder
  root 'pages#index'
  get '/secret', to: 'pages#secret'
  get '/api/docs', to: 'pages#apidocs'

  # API with Grape
  mount API::Root => '/'

  # User management with Devise
  devise_for :users

  # oAuth2 with Doorkeepr
  use_doorkeeper
end
