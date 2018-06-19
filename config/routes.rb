# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  # API Endpoints
  api_version(module: 'api/v1', path: { value: 'api/v1' }, defaults: { format: :json }) do
    # User
    resources :users do
      collection do
        resources :sessions, only: [:create] do
          collection do
            post :renew
            post :invalidate_all
          end
        end
      end
    end

    # Books
    resources :books, only: %i[index show]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
