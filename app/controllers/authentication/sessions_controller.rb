# frozen_string_literal: true

class Authentication::SessionsController < Devise::SessionsController
  def respond_with(resource, _opts = {})
    puts "Jacky sessions resource"
    puts resource

    if resource.errors.any?
      render json: { errors: resource.errors.full_messages }, status: :unprocessable_entity
    else
      @user = resource
      render 'users/show'
    end
  end
end
