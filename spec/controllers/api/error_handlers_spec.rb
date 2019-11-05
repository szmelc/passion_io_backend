# frozen_string_literal: true

require 'rails_helper'

RSpec.describe API::ErrorHandlers do
  include Rack::Test::Methods

  subject do
    Class.new(Grape::API) do
      include API::ErrorHandlers
      format :json
    end
  end

  def app
    subject
  end
  describe 'rescue_from ActiveRecord::RecordNotFound' do
    before do
      subject.namespace do
        post do
          raise ActiveRecord::RecordNotFound, "Couldn't find record"
        end
      end
    end

    let(:error_response) do
      {
        'errors' => ["Couldn't find record"]
      }
    end

    it 'returns proper status' do
      post '/'
      expect(last_response.status).to eq(404)
    end

    it 'returns proper error' do
      post '/'
      expect(JSON.parse(last_response.body)).to eq(error_response)
    end
  end

  describe 'rescue_from Grape::Exceptions::ValidationErrors' do
    before do
      subject.namespace do
        post do
          raise Grape::Exceptions::ValidationErrors
        end
      end
    end

    let(:status) { 400 }
    let(:error_response) do
      {
        'errors' => {}
      }
    end

    it 'returns proper status' do
      post '/'
      expect(last_response.status).to eq(400)
    end

    it 'returns proper error' do
      post '/'
      expect(JSON.parse(last_response.body)).to eq(error_response)
    end
  end

  describe 'rescue_from Pundit::NotAuthorizedError' do
    before do
      subject.namespace do
        post do
          raise Pundit::NotAuthorizedError
        end
      end
    end

    let(:error_response) do
      {
        'errors' => ['Forbidden']
      }
    end

    it 'returns proper status' do
      post '/'
      expect(last_response.status).to eq(403)
    end

    it 'returns proper error' do
      post '/'
      expect(JSON.parse(last_response.body)).to eq(error_response)
    end
  end
end
