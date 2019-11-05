# frozen_string_literal: true

require 'rails_helper'

RSpec.describe API::Helpers::ResponseHelpers, type: :request do
  include Rack::Test::Methods
  subject do
    Class.new(Grape::API) do
      helpers API::Helpers::ResponseHelpers
      format :json
    end
  end

  let(:warden) { double }

  def app
    subject
  end

  describe '#return_errors' do
    before do
      user = User.new(email: 'invalid @ email', password: '123123', display_name: 'Test')
      subject.namespace do
        post do
          return_errors(user)
        end
      end
    end

    context 'when saved record is not valid' do
      it 'returns JSON with errors key' do
        post '/'
        expect(JSON.parse(last_response.body)).to have_key('errors')
      end
    end
  end
end
