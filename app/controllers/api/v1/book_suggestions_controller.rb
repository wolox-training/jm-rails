# frozen_string_literal: true

module Api
  module V1
    class BookSuggestionsController < ApiController
      skip_before_action :authenticate_request
      def create
        @suggestion = BookSuggestion.new(suggest_params)
        @suggestion.user = current_user
        render json: @suggestion.errors, status: :unprocessable_entity if @suggestion.invalid?
        @suggestion.save
        render json: @suggestion, status: :created
      end

      def suggest_params
        params.require(:book_suggestion)
              .permit(:author, :link, :title, :editorial, :price, :publisher, :year)
      end
    end
  end
end
