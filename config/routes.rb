Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#home'
  
  resources :cooperatives do
    resources :units
  end
end
