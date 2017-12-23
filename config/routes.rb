Rails.application.routes.draw do
  # devise_for :users
  # User management

  root 'welcome#index'
  mount API::Root => '/'
end
