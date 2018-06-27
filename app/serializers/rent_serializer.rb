# frozen_string_literal: true

class RentSerializer < ActiveModel::Serializer
  attributes :id, :from, :to, :book
end
