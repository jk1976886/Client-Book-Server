class UsersController < ApplicationController
  before_action :authenticate_user!

  def show_current_user
    @user = current_user
    render 'users/show'
  end
end
