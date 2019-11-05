# frozen_string_literal: true

namespace :oauth do
  task setup: :environment do
    puts '---- Creating Doorkeeper applicatio ----'
    Doorkeeper::Application.create!(name: 'Doorkeeper Development Application', redirect_uri: 'http://localhost:3000')
  end
end
