user = User.create!(email: "test@test.com", password: "Testing123")

tag1 = Tag.create!(name: "Tag1", order: 1, user: user)
tag2 = Tag.create!(name: "Tag2", order: 1, user: user)

(0..9).each do |counter|
  client = Client.create!(user: user, first_name: "First #{counter}", last_name: "Last #{counter}", email: "client#{counter}@test.com", phone: "416000000#{counter}")

  if counter % 2 == 0
    client.update!(gender: "male")
    client_tag = ClientTag.create!(client: client, tag: tag1)
  else
    client.update!(gender: "female")
    client_tag = ClientTag.create!(client: client, tag: tag2)
  end
end
