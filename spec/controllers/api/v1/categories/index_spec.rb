# frozen_string_literal: true

require 'rails_helper'

RSpec.describe API::V1::Categories::Index, type: :request do
  include_context 'when authenticated'

  describe 'GET /api/v1/categories' do
    subject { get '/api/v1/categories', params: params, headers: headers }

    let(:vertical) { create(:vertical) }
    let!(:category_1) { create(:category, vertical: vertical) }
    let!(:category_2) { create(:category, vertical: vertical) }
    let(:params) do
      {
        vertical_id: vertical.id
      }
    end

    context 'when all params are valid' do
      it_behaves_like '200'
    end

    context 'when params are invalid' do
      context 'when a parameter is missing' do
        before { params.delete(:vertical_id) }

        it_behaves_like '400'
      end
    end
  end
end
