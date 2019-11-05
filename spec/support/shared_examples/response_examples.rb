# frozen_string_literal: true

RSpec.shared_examples '200' do
  it 'responds with ok status' do
    subject
    expect(response).to have_http_status(:ok)
  end
end

RSpec.shared_examples '201' do
  it 'responds with created status' do
    subject
    expect(response).to have_http_status(:created)
  end
end

RSpec.shared_examples '204' do
  it 'responds with no_content status' do
    subject
    expect(response).to have_http_status(:no_content)
  end
end

RSpec.shared_examples '400' do
  it 'responds with bad_request status' do
    subject
    expect(response).to have_http_status(:bad_request)
  end
end

RSpec.shared_examples '404' do
  it 'responds with not_found status' do
    subject
    expect(response).to have_http_status(:not_found)
  end
end
