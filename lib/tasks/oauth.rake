# frozen_string_literal: true

namespace :oauth do
  task setup: :environment do
    puts '---- Creating Doorkeeper application ----'
    uri = Rails.env.development? ? 'http://localhost:3000' : 'https://evening-stream-34331.herokuapp.com/'
    Doorkeeper::Application.create!(name: 'Doorkeeper Development Application', redirect_uri: uri)
  end
end
