require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:courses).dependent(:destroy) }
  end


  describe 'validations' do
    it { is_expected.to validate_presence_of(:display_name) }
  end
end
