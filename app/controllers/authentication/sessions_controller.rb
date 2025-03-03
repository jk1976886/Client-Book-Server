# frozen_string_literal: true

class Authentication::SessionsController < Devise::SessionsController
  respond_to :json
  skip_before_action :verify_signed_out_user, only: :destroy

  protected

  def respond_with(resource, _opts = {})
    puts "Jacky sessions resource"
    puts resource
    @user = resource
    render 'users/show'
  end

  private

  def respond_to_on_destroy
    if request.format.json?
      render json: { message: "Logged out successfully" }, status: :ok
    else
      head :no_content
    end
  end
end
