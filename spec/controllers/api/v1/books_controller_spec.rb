# frozen_string_literal: true

require 'rails_helper'
require 'support/authenticated_user'

module Api
  module V1
    describe BooksController, type: :controller do
      include_context 'Authenticated User'

      describe 'GET #index' do
        context 'When fetching all the books' do
          let(:books) { create_list(:book, 5) }
          before do
            get :index
          end
          it 'responses with the books json' do
            expected = ActiveModel::Serializer::CollectionSerializer.new(
              books, each_serializer: BookSerializer
            ).to_json
            expect(response.body.to_json) =~ JSON.parse(expected)
          end

          it 'responses with status 200' do
            expect(response).to have_http_status(:ok)
          end
        end
      end

      describe 'GET #show' do
        context 'When fetching a Book' do
          let!(:book) { create(:book) }
          before do
            get :show, params: { id: book.id }
          end
          it 'responses with the book json' do
            expect(response.body).to eq BookSerializer.new(
              book, root: false
            ).to_json
          end

          it 'responses with status 200' do
            expect(response).to have_http_status(:ok)
          end
        end
      end
    end
  end
end
