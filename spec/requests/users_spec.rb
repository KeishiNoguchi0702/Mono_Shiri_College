require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /show' do
    it 'indexアクションにアクセスすると正常にレスポンスが返ってくる' do
      get root_path
      expect(response.status).to eq 200
    end
  end
end
