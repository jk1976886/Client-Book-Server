class ClientsController < ApplicationController
  before_action :authenticate_user!

  def index
    @clients = current_user.clients
    render 'clients/index'
  end

  def create
    @client = Client.create!(client_params.merge({user: current_user}))
    render 'clients/show'
  end

  def update
    @client = current_user.clients.find_by!(id: params[:id])
    @client.update!(client_params)
    render 'clients/show'
  end

  def destroy
    @client = current_user.clients.find_by!(id: params[:id])
    @client.destroy!
    render head: :ok
  end

  private

  def client_params
    params.permit(:first_name, :last_name, :email, :phone, :wechat)
  end
end
