# frozen_string_literal: true

FactoryBot.define do
  factory :access_token, class: Doorkeeper::AccessToken do
    token { '123456' }
    sequence(:resource_owner_id) { |n| n }
    expires_in { 2.hours }
  end
end
