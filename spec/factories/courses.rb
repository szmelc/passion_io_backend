# frozen_string_literal: true

FactoryBot.define do
  factory :course do
    category
    association :author, factory: :user
    name { 'How to stay fit forever' }
    state { 'active' }
  end
end
