# Read about factories at https://github.com/thoughtbot/factory_girl
require "faker"

FactoryGirl.define do
  factory :album do
    artist

    name { Faker::Name.name }
    is_compilation { Faker::Number.digit.to_i.even? }
  end
end
