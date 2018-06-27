# frozen_string_literal: true

module Api
  module V1
    class BooksController < ApiController
      before_action :authenticate_request
      include Wor::Paginate
      def index
        @books = Book.all
        render_paginated @books, each_serializer: BookIndexSerializer
      end

      def show
        @book = Book.find(params[:id])
        render json: @book
      end
    end
  end
end
