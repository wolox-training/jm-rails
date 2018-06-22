# frozen_string_literal: true

class BookIndexSerializer < ActiveModel::Serializer
  attributes :id, :author, :title, :image, :publisher, :year, :genre
end
