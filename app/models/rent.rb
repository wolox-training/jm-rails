# frozen_string_literal: true

class Rent < ApplicationRecord
  validates :from, :to, presence: true
  belongs_to :user
  belongs_to :book
end
