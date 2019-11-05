# frozen_string_literal: true

require 'rails_helper'

RSpec.describe API::V1::Courses::Index, type: :request do
  include_context 'when authenticated'

  describe 'GET /api/v1/courses' do
    subject { get '/api/v1/courses', params: params, headers: headers }

    let!(:category) { create(:category) }
    let(:params) do
      {
        category_id: category.id
      }
    end

    context 'when all params are valid' do
      it_behaves_like '200'
    end

    context 'when params are invalid' do
      context 'when a parameter is missing' do
        before { params.delete(:category_id) }

        it_behaves_like '400'
      end
    end
  end
end
