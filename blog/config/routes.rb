# frozen_string_literal: true

Rails.application.routes.draw do
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  
  root 'articles#index'
  
  resources :articles do
    resources :comments
  end

  namespace :apis do
    namespace :articles do
      namespace :v1 do
        resources :articles
      end
    end
    namespace :comments do
      namespace :v1 do
        resources :articles do
          resources :comments
        end
      end
    end
  end
end
