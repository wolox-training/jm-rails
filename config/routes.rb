# frozen_string_literal: true

Rails.application.routes.draw do

  root 'welcome#index'

  devise_for :users

  # API Endpoints
  api_version(module: 'api/v1', path: { value: 'api/v1' }, defaults: { format: :json }) do
    resources :users do
      collection do
        resources :sessions, only: [:create] do
          collection do
            post :renew
            post :invalidate_all
          end
        end
      end
      resources :rents, only: %i[index create show destroy]
    end

    resources :books, only: %i[index show] do
      resources :rents, only: [:index]
    end
  end
end
