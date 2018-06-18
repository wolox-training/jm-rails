# frozen_string_literal: true

FactoryBot.define do
  factory :rent do
    user
    book
    from { Faker::Date.between(3.months.ago, Time.zone.today) }
    to { Faker::Date.between(3.months.ago, Time.zone.today) }
  end
end
