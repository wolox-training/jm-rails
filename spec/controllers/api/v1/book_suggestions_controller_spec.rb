# frozen_string_literal: true

require 'rails_helper'

describe Api::V1::BookSuggestionsController, type: :controller do
  describe 'POST #create' do
    context 'when creating a valid book suggestion' do
      let(:valid_params) do
        {
          book_suggestion: {
            author:    'Fake Name Lastname',
            link:    'http://www.fakeurl.com',
            title:    'Fake Title',
            editorial:  'Fake Editorial',
            price:    100,
            publisher:  'Fake Publisher',
            year:    2010
          }
        }
      end
      it 'creates a new suggestion' do
        expect do
          post :create, params: valid_params
        end.to change { BookSuggestion.count }.by(1)
      end
      it 'responds with 201 status' do
        post :create, params: valid_params
        expect(response).to have_http_status(:created)
      end
    end

    context 'when creating an invalid book suggestion' do
      let(:invalid_params) do
        {
          book_suggestion: {
            author:      nil,
            link:       'http://www.fakeurl.com',
            title:      'Fake Title',
            editorial:  'Fake Editorial',
            price:      100,
            publisher:  'Fake Publisher',
            year:       2010
          }
        }
      end
      before do
        post :create, params: invalid_params
      end

      it 'fails to create a new book suggestion' do
        expect do
          post :create, params: invalid_params
        end.to change { BookSuggestion.count }.by(0)
      end

      it 'returns error messages' do
        expect(response.body['error']).to be_present
      end

      it 'responds with 422 status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
