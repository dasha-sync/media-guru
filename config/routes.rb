# frozen_string_literal: true

Rails.application.routes.draw do
  get 'marks/index'
  get 'marks/show'
  get 'marks/new'
  get 'marks/create'
  get 'marks/edit'
  get 'marks/update'
  get 'marks/destroy'
  get 'videos/index'
  get 'users_control/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'

  devise_for :users

  resources :users_control

  resources :videos do
    resources :reviews
  end

  resources :videos do
    resources :video_languages
    resources :video_categories
    resources :video_tags
    resources :video_speakers
    resources :marks
  end
end
