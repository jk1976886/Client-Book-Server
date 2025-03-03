# frozen_string_literal: true

class Authentication::PasswordsController < Devise::PasswordsController
  respond_to :json
end
