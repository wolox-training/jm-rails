# frozen_string_literal: true

class BookSerializer < ActiveModel::Serializer
  attributes :id, :author, :title, :genre, :publisher, :year, :image, :rents
end
