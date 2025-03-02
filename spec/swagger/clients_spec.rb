require 'swagger_helper'

RSpec.describe 'api/clients', type: :request, swagger: true, resource: :user do
  path 'api/clients' do
    get 'index clients' do
      operationId 'indexClients'
      consumes 'application/json'
      parameter name: :limit, in: :query, schema: { type: :integer }, required: false
      parameter name: :offset, in: :query, schema: { type: :integer }, required: false

      let(:limit) {10}

      let(:offset) {0}

      response '200', 'index clients' do
        run_test!
      end

      response '422', 'invalid request' do
        let(:blog) { { title: 'foo' } }
        run_test!
      end
    end
  end
end
