json.extract! client, :id, :created_at, :updated_at, :email

json.tags do
  json.array! client.client_tags, partial: 'client_tags/client_tag', as: :client_tag
end
