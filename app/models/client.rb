class Client < ApplicationRecord
  belongs_to :user
  has_many :client_client_tags
  has_many :client_tags, through: :client_client_tags
end
