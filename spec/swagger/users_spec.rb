require 'swagger_helper'

RSpec.describe 'authentication/users', type: :request, swagger: true do
  path 'authentication/users/sign_in' do
    post 'sign in' do
      operationId 'signIn'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :sign_in_body, in: :body, schema: {
        type: 'object',
        properties: {
          user: {
            type: :object,
            properties: {
              email: {
                type: :string
              },
              password: {
                type: :string
              }
            },
            required: [:email, :password]
          }
        },
        required: [:user]
      }

      response '200', 'signed in' do
        let(:password) { 'Testing123'}
        let(:user) { User.create!(email: 'john@doe.com', password: password)}
        let(:sign_in_body) {{
          user:{
            email: user.email,
            password: password
          }
        }}

        run_test!
      end
    end
  end

  path 'authentication/users/sign_out' do
    delete 'sign out' do
      operationId 'signOut'
      consumes 'application/json'
      produces 'application/json'

      response '204', 'index clients' do
        let(:password) { 'Testing123'}
        let(:user) { User.create!(email: 'john@doe.com', password: password)}
        let(:setup) {
          sign_in(user)
        }
        run_test!
      end
    end
  end

  path 'authentication/users/' do
    post 'sign up' do
      operationId 'signUp'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :sign_up_body, in: :body, schema: {
        type: 'object',
        properties: {
          user: {
            type: :object,
            properties: {
              email: {
                type: :string
              },
              password: {
                type: :string
              }
            },
            required: [:email, :password]
          }
        },
        required: [:user]
      }

      response '200', 'sign up' do
        let(:password) { 'Testing123'}
        let(:sign_up_body) {{
          user:{
            email: 'user@test.com',
            password: password
          }
        }}
        run_test!
      end
    end
  end

  path "/api/current_user" do
    get "shows the current user" do
      operationId "currentUser"
      consumes 'application/json'
      produces 'application/json'

      response '200', 'user shown' do
        run_test!
      end
    end
  end
end
