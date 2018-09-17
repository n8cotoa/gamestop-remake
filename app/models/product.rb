class Product < ApplicationRecord
  has_many :order_items
  has_many :orders, through: :order_items

  def self.get_ten_games
    response = RestClient::Request.execute(
      method: :get,
      url: 'https://api-endpoint.igdb.com/games/?fields=id,name,cover&limit=10',
      headers: {user_key: ENV['games_key']}
      )
    JSON.parse(response)
  end
end
