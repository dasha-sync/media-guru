# frozen_string_literal: true

Rails.application.routes.draw do
  get 'marks/index'
  get 'marks/show'
  get 'marks/new'
  get 'marks/create'
  get 'marks/edit'
  get 'marks/update'
  get 'marks/destroy'
  get 'films/index'
  get 'users_control/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'

  devise_for :users

  resources :users_control

  resources :films do
    resources :reviews
  end

  resources :films do
    resources :film_countries
  end
end
