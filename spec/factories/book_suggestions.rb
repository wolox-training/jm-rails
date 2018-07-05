# frozen_string_literal:true

FactoryBot.define do
  factory :book_suggestion do
    editorial { Faker::Book.publisher }
    price { Faker::Commerce.price }
    author { Faker::Book.author }
    title { Faker::Book.title }
    link { Faker::Internet.url }
    publisher { Faker::Book.publisher }
    year { Faker::Date.between(50.years.ago, Time.zone.today).year }
    user
  end
end
