# frozen_string_literal: true

module Api
  module V1
    class BookSuggestionsController < ApiController
      skip_before_action :authenticate_request
      def create
        @suggestion = BookSuggestion.new(suggest_params)
        @suggestion.user_id = current_user.id if current_user

        if @suggestion.valid?
          @suggestion.save
          render json: @suggestion
        else
          render json: @suggestion.errors, status: :unprocessable_entity
        end
      end

      def suggest_params
        params.require(:book_suggestion)
              .permit(:author, :link, :title, :editorial, :price, :publisher, :year)
      end
    end
  end
end
