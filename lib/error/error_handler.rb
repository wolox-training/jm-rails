# frozen_string_literal: true

# Error module to Handle errors globally
# include Error::ErrorHandler in application_controller.rb
module Error
  module ErrorHandler
    def self.included(clazz)
      clazz.class_eval do
        rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
        rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
      end
    end

    private

    def record_not_found
      json = Helpers::Render.json(:record_not_found)
      render json: json, status: :not_found
    end

    def user_not_authorized
      json = Helpers::Render.json(:user_not_authorized)
      render json: json, status: :unauthorized
    end
  end
end
