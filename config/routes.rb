# frozen_string_literal: true

Rails.application.routes.draw do
  get 'videos/index'
  get 'users_control/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'

  devise_for :users

  resources :users_control

  resources :languages
  resources :categories
  resources :tags
  resources :speakers

  resources :videos do
    resources :reviews
    resources :video_languages
    resources :video_categories
    resources :video_tags
    resources :video_speakers
    resources :marks
  end
end
