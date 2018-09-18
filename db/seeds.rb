# frozen_string_literal: true

response = RestClient::Request.execute(
  method: :get,
  url: 'https://api-endpoint.igdb.com/games/?fields=id,name,cover&limit=50',
  headers: { user_key: ENV['game_key'] }
)

parsed_info = JSON.parse(response)

parsed_info.each do |game|
  ran_num = Random.rand(5..25)
  unless game['cover'].nil?
    Product.create(name: game['name'], price: ran_num, cover_image: game['cover']['url'])
  end
end
