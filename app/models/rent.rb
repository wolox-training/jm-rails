# frozen_string_literal: true

class Rent < ApplicationRecord
  validates :from, :to, :book_id, presence: true
  validate :rent_from_date, :rent_to_date, :book_rented
  validates_associated :book
  belongs_to :user
  belongs_to :book

  def rent_from_date
    errors.add(:from, "Can't be in the past") if from.present? && from < Time.zone.today
  end

  def rent_to_date
    errors.add(:to, "Can't be in the past") if to.present? && from < Time.zone.today
  end

  def book_rented
    return if book.nil?
    errors.add(:book, 'is already rented in those dates') if book.rented_on_range?(from, to)
  end
end
