# frozen_string_literal:true

class BookSuggestion < ApplicationRecord
  validates :author, :title, :link, presence: true
  validates :price, numericality: { greater_than: 0 }, allow_nil: true
  validate :year_cannot_be_in_the_future
  belongs_to :user, optional: true

  def year_cannot_be_in_the_future
    errors.add(:year, "Can't be in the future") if year.present? &&
                                                   year.to_i > Time.zone.today.year
  end
end
