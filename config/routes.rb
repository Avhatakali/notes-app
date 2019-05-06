Rails.application.routes.draw do
  resources :users
  root 'users#login'
  post 'login', to: 'users#login'
end
