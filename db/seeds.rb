ActiveRecord::Base.transaction do
  user = User.create!(email: "user@test.com", password: "Testing123")

  tag1 = ClientTag.create!(name: "Tag1", order: 1, user: user)
  tag2 = ClientTag.create!(name: "Tag2", order: 1, user: user)

  (0..9).each do |counter|
    client = Client.create!(user: user, first_name: "First #{counter}", last_name: "Last #{counter}", email: "client#{counter}@test.com", phone: "416000000#{counter}")

    if counter % 2 == 0
      client.update!(gender: "male")
      client_tag = ClientClientTag.create!(client: client, client_tag: tag1)
    else
      client.update!(gender: "female")
      client_tag = ClientClientTag.create!(client: client, client_tag: tag2)
    end
  end
end
