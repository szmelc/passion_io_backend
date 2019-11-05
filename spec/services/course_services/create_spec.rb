# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CourseServices::Create do
  describe '#call' do
    subject { described_class.new(params, user).call }

    let(:category) { create(:category) }
    let(:user) { create(:user) }
    let(:course_name) { 'Sample Name' }
    let(:params) do
      {
        name: course_name,
        state: 1,
        category_id: category.id
      }
    end

    context 'when params are valid' do
      it 'creates a course' do
        expect { subject }.to change { Course.count }.by(1)
      end

      it 'returns instance of Result::Success', :aggregate_failures do
        expect(subject.success?).to be(true)
        expect(subject).to be_a(Result::Success)
      end
    end

    context 'when params are invalid' do
      let(:course_name) { 'a' }

      it 'does not create a course' do
        expect { subject }.not_to(change { Course.count })
      end

      it 'returns instance of Result::Failure' do
        expect(subject.success?).to be(false)
        expect(subject).to be_a(Result::Failure)
      end
    end
  end
end
