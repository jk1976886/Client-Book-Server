# frozen_string_literal: true

class Authentication::RegistrationsController < Devise::RegistrationsController
  def respond_with(resource, _opts = {})
    puts "Jacky resource"
    puts resource

    if resource.errors.any?
      render json: { errors: resource.errors.full_messages }, status: :unprocessable_entity
    else
      @user = resource
      render 'users/show'
    end
  end
end