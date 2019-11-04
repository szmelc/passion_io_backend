# frozen_string_literal: true

require 'rails_helper'

RSpec.describe API::Helpers::AuthHelpers, type: :request do
  include Rack::Test::Methods
  subject do
    Class.new(Grape::API) do
      helpers API::Helpers::AuthHelpers
      format :json
    end
  end

  let(:user) { create(:user) }
  let(:warden) { double }

  def app
    subject
  end

  shared_examples '201' do
    it 'returns status code 201' do
      post '/'
      expect(last_response.status).to eq(201)
    end
  end

  describe '#authenticate_user!' do
    before do
      subject.namespace do
        post do
          authenticate_user!
        end
      end
      allow(Rails.env).to receive(:development?).and_return(true)
    end

    context 'when authentication token is present' do
      let(:access_token) { create(:access_token, resource_owner_id: user.id).token }

      before { header 'Authorization', "Bearer #{access_token}" }

      it_behaves_like '201'

      it 'returns nil' do
        post '/'
        expect(last_response.body).to eq('null')
      end
    end

    context 'when authentication token is missing' do
      it 'returns proper status' do
        post '/'
        expect(last_response.status).to eq(401)
      end
    end
  end

  describe '#current_user' do
    before do
      subject.namespace do
        post do
          current_user
        end
      end
      header 'Authorization', "Bearer #{access_token}"
      allow(Rails.env).to receive(:development?).and_return(true)
    end

    context 'when token resource owner is present' do
      let(:access_token) { create(:access_token, resource_owner_id: user.id).token }

      it_behaves_like '201'

      it 'renders current user', :aggregate_failures do
        post '/'
        expect(JSON.parse(last_response.body)['id']).to eq(user.id)
        expect(JSON.parse(last_response.body)['email']).to eq(user.email)
      end
    end
  end
end
