require 'rails_helper'

RSpec.describe 'Tops', type: :request do
  describe 'GET /index' do
    it 'indexアクションにアクセスすると正常にレスポンスが返ってくる' do
      get root_path
      expect(response.status).to eq 200
    end

    it 'returns 200' do
      get root_path
      expect(response).to have_http_status '200'
    end
  end
end
