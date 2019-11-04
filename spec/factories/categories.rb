# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    vertical
    name { 'Beauty & Fitness' }
    state { 'active' }
  end
end
