# frozen_string_literal: true

require 'rails_helper'

RSpec.describe API::V1::Categories::Create, type: :request do
  include_context 'when authenticated'

  describe 'POST /api/v1/categories' do
    subject { post '/api/v1/categories', params: params, headers: headers }

    let(:class_instance) { instance_double(CategoryServices::Create, params: params) }
    let(:vertical) { create(:vertical) }
    let(:params) do
      {
        name: 'Sample Name',
        state: 1,
        vertical_id: vertical.id
      }
    end

    before do
      allow(CategoryServices::Create).to receive(:new).with(params).and_return(class_instance)
      allow(class_instance).to receive(:call).and_return(Result::Success.new(nil, nil))
    end

    context 'when all params are valid' do
      it_behaves_like '201'

      it 'calls CategoryServices::Create' do
        expect(class_instance).to receive(:call)
        subject
      end
    end

    context 'when params are invalid' do
      context 'when a parameter is missing' do
        before { params.delete(:name) }

        it_behaves_like '400'

        it 'does not call CategoryServices::Create' do
          expect(class_instance).not_to receive(:call)
          subject
        end
      end
    end
  end
end
