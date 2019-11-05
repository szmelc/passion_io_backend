# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    vertical
    name { Faker::Name.name }
    state { 'active' }
  end
end
