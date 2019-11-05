# frozen_string_literal: true

require 'rails_helper'

RSpec.describe API::V1::Categories::Destroy, type: :request do
  include_context 'when authenticated'

  describe 'POST /api/v1/categories/:category_id' do
    subject { delete "/api/v1/categories/#{category_id}", headers: headers }

    let!(:category) { create(:category) }
    let(:category_id) { category.id }

    context 'when all params are valid' do
      it_behaves_like '204'

      it 'deletes a category' do
        expect { subject }.to change { Category.count }.by(-1)
      end
    end

    context 'when params are invalid' do
      context 'when a category does not exist' do
        let(:category_id) { category.id + 100 }

        it_behaves_like '404'
      end
    end
  end
end
