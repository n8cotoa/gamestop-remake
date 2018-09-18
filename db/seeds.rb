# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
response = RestClient::Request.execute(
  method: :get,
  url: 'https://api-endpoint.igdb.com/games/?fields=id,name,cover&limit=50',
  headers: {user_key: ENV['game_key']}
  )

parsed_info = JSON.parse(response)

parsed_info.each do |game|
  ran_num = Random.rand(5..25)
  if game['cover'] != nil
    Product.create(name: game['name'], price: ran_num, cover_image: game['cover']['url'])
  end
end
