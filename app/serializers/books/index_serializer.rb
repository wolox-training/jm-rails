# frozen_string_literal: true

module Books
  class IndexSerializer < ActiveModel::Serializer
    attributes :id, :author, :title, :image, :publisher, :year, :genre
  end
end
