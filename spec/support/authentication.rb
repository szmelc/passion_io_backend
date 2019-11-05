# frozen_string_literal: true

RSpec.shared_context 'when authenticated' do
  let(:user) { create(:user) }
  let(:access_token) { create(:access_token, resource_owner_id: user.id).token }

  let(:headers) do
    {
      'Content-Type' => 'application/x-www-form-urlencoded',
      'Authorization' => "Bearer #{access_token}"
    }
  end
end

RSpec.shared_context 'when not authenticated' do
  let(:headers) { { 'Content-Type' => 'application/x-www-form-urlencoded' } }
end
