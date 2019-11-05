# frozen_string_literal: true

require 'rails_helper'

RSpec.describe API::V1::Verticals::Index, type: :request do
  include_context 'when authenticated'

  describe 'GET /api/v1/verticals' do
    subject { get '/api/v1/verticals', headers: headers }

    it_behaves_like '200'
  end
end
