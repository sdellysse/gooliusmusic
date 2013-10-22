# Read about factories at https://github.com/thoughtbot/factory_girl
require "faker"

FactoryGirl.define do
  factory :artist do
    name { Faker::Name.name }
    is_group { Faker::Number.digit.to_i.even? }
  end
end
