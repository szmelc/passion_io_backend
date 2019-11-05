# frozen_string_literal: true

require 'rails_helper'

RSpec.describe API::V1::Courses::Destroy, type: :request do
  include_context 'when authenticated'

  describe 'POST /api/v1/courses/:course_id' do
    subject { delete "/api/v1/courses/#{course_id}", headers: headers }

    let(:user) { create(:user) }
    let!(:course) { create(:course, author: user) }
    let(:course_id) { course.id }

    context 'when all params are valid' do
      it_behaves_like '204'

      it 'deletes a course' do
        expect { subject }.to change { Course.count }.by(-1)
      end
    end

    context 'when params are invalid' do
      context 'when a course does not exist' do
        let(:course_id) { course.id + 100 }

        it_behaves_like '404'
      end
    end
  end
end
