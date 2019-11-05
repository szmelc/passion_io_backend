# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Vertical, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:categories).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }

    describe 'name uniqueness validation' do
      context 'when there already exists a category with the same name' do
        let!(:category) { create(:category) }
        let(:vertical) { build(:vertical, name: category.name) }

        it 'does not allow to create vertical with the same name as existing category', :aggregate_failures do
          expect(vertical).not_to be_valid
          expect(vertical.errors.messages[:name]).to include('there already is a category with the same name')
        end
      end
    end
  end
end
