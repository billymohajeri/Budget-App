require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  let(:user) { FactoryBot.create(:user) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get '/'
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get '/categories/new'
      expect(response).to be_successful
    end
  end
end
