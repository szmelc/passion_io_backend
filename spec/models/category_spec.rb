require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:vertical) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:state) }

    describe 'name uniqueness validation' do
      context 'when there already exists a vertical with the same name' do
        let!(:vertical) { create(:vertical) }
        let(:category) { build(:category, name: vertical.name) }

        it 'does not allow to create category with the same name as existing vertical', :aggregate_failures do
          expect(category).not_to be_valid
          expect(category.errors.messages[:name]).to include(": there already is a vertical with the same name")
        end
      end
    end
  end
end
