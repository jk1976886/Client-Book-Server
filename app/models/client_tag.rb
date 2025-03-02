class ClientTag < ApplicationRecord
  belongs_to :user
  has_many :client_client_tags
  has_many :client, through: :client_client_tags
end
