require 'rails_helper'

RSpec.describe AuthenticationController, type: :request do
  before(:all) do
    generate_user
  end

  context 'authentication' do
    it 'valid user authentication' do
      post '/authenticate', email: "test@test.com", password: 'test123'
      expect(last_response.status).to eq(200)
    end

    it 'invalid user authentication' do
      post '/authenticate', email: "test@test.com", password: 'test'
      expect(last_response.status).to eq(401)
    end
  end
end
