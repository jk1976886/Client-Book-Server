class ClientClientTag < ApplicationRecord
  belongs_to :client
  belongs_to :client_tag
end
