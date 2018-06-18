# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    genre { Faker::Book.genre }
    author { Faker::Book.author }
    image { Faker::File.file_name('images', title, 'png') }
    title { Faker::Book.title }
    publisher { Faker::Book.publisher }
    year { Faker::Date.between(50.years.ago, Time.zone.today).year }
  end
end
