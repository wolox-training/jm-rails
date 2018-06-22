# frozen_string_literal: true

# Error module to Handle errors globally
# include Error::ErrorHandler in application_controller.rb
module Error
  module ErrorHandler
    def self.included(clazz)
      clazz.class_eval do
        rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
      end
    end

    private

    def record_not_found
      json = Helpers::Render.json(:record_not_found)
      render json: json, status: :not_found
    end
  end
end
