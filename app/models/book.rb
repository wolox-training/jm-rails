# frozen_string_literal: true

class Book < ApplicationRecord
  validates :genre, :author, :image, :title, :publisher, :year, presence: true
  has_many :rents, dependent: :destroy

  def rented_on_range?(rented_from, rented_to)
    if rents.present?
      @rents = rents
      @rents.each do |rent|
        if rented_from.between?(rent.from, rent.to) || rented_to.between?(rent.from, rent.to)
          return true
        end
      end
    end
    false
  end
end
