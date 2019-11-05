# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CategoryServices::Create do
  describe '#call' do
    subject { described_class.new(params).call }

    let(:vertical) { create(:vertical) }
    let(:category_name) { 'Sample Name' }
    let(:params) do
      {
        name: category_name,
        state: 1,
        vertical_id: vertical.id
      }
    end

    context 'when params are valid' do
      it 'creates a category' do
        expect { subject }.to change { Category.count }.by(1)
      end

      it 'returns instance of Result::Success', :aggregate_failures do
        expect(subject.success?).to be(true)
        expect(subject).to be_a(Result::Success)
      end
    end

    context 'when params are invalid' do
      let(:category_name) { 'a' }

      it 'does not create a category' do
        expect { subject }.not_to(change { Category.count })
      end

      it 'returns instance of Result::Failure' do
        expect(subject.success?).to be(false)
        expect(subject).to be_a(Result::Failure)
      end
    end
  end
end
