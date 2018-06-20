# frozen_string_literal: true

require 'rails_helper'

describe BooksController, type: :controller do

  describe "GET #index" do
    context 'When fetching all the books' do
      let(:books) { create_list(:book, 5) }
      it 'returns http success' do
        get :index
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "GET #show" do
    it 'returns http success' do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

end
