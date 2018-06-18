# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.safe_email(first_name + last_name) }
    password { Faker::Internet.password(9) }
    password_confirmation { password }
  end
end
