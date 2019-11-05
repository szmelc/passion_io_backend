# frozen_string_literal: true

require 'rails_helper'

RSpec.describe API::V1::Courses::Create, type: :request do
  include_context 'when authenticated'

  describe 'POST /api/v1/courses' do
    subject { post '/api/v1/courses', params: params, headers: headers }

    let(:class_instance) { instance_double(CourseServices::Create, params: params, user: user) }
    let(:mailer_instance) { instance_double(ActionMailer::MessageDelivery) }
    let(:user) { create(:user) }
    let(:category) { create(:category) }
    let(:params) do
      {
        name: 'Sample Name',
        state: 1,
        category_id: category.id
      }
    end

    before do
      allow(CourseServices::Create).to receive(:new).with(params, user).and_return(class_instance)
      allow(NotificationMailer).to receive(:course_created).and_return(mailer_instance)

      allow(class_instance).to receive(:call).and_return(Result::Success.new(nil, nil))
      allow(mailer_instance).to receive(:deliver_later)
    end

    context 'when all params are valid' do
      it_behaves_like '201'

      it 'calls CourseServices::Create' do
        expect(class_instance).to receive(:call)
        subject
      end

      it 'calls enqueues NotificationMailer.course_created' do
        expect(mailer_instance).to receive(:deliver_later)
        subject
      end
    end

    context 'when params are invalid' do
      context 'when a parameter is missing' do
        before { params.delete(:name) }

        it_behaves_like '400'

        it 'does not call CourseServices::Create' do
          expect(class_instance).not_to receive(:call)
          subject
        end
      end
    end
  end
end
