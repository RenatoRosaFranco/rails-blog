# frozen_string_literal: true
Rails.application.routes.draw do

  # Authentication
  # @implemented
  devise_for :users

  # Application
  # @implemented
  root to: 'posts#index'
  resources :newsletters, param: :token, only: [:create, :destroy]

  # Account
  # @implemented
  scope :account do
    resources :users, only: [:show, :edit, :update, :destroy]
  end

  # Blog
  # @implemented
  scope :blog do
    resources :categories
    resources :posts
  end

  # API
  # @implemented
  namespace :api do
    namespace :v1 do
      # some json here
    end
    namespace :v2 do
      # some xml here
    end
  end
end
