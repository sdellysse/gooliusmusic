# Read about factories at https://github.com/thoughtbot/factory_girl
require "faker"

FactoryGirl.define do
  factory :disc do
    album
    number { Faker::Number.number(2) }
  end
end
