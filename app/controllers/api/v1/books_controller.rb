# frozen_string_literal: true

module Api
  module V1
    class BooksController < ApplicationController
      def index
        @books = Book.all
      end

      def show
        @book = Book.find(params[:id])
      end
    end
  end
end

