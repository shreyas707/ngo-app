Rails.application.routes.draw do
  resources :educators
  resources :learners
  resources :organizations
  resources :subjects
  resources :chapters
  resources :schedules
  get 'home/index'
  root 'home#index'
  devise_for :users
  scope "/admin" do
    resources :users
  end
  # devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
