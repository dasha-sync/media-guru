# frozen_string_literal: true

Rails.application.routes.draw do
  get 'films/index'
  get 'users_control/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'

  devise_for :users

  resources :users_control
  resources :films
end
