Rails.application.routes.draw do
  # Main page - placeholder
  root 'welcome#index'

  # API with Grape
  mount API::Root => '/'

  # User management with Devise
  devise_for :users
end
