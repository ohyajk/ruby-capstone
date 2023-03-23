require 'json'

module GameData
  def save_game_data
    @game_data = []
    @games.each do |game|
      @game_data.push('last_played_at' => game.last_played_at,
                      'multiplayer' => game.multiplayer,
                      'publish_date' => game.publish_date)
    end
    File.write('storage/game_data.json', JSON.pretty_generate(@game_data))
  end

  def load_game_data
    File.write('storage/game_data.json', JSON.pretty_generate([])) unless File.exist?('storage/game_data.json')
    @game_data = JSON.parse(File.read('storage/game_data.json'))
    @game_data.each do |game|
      @games.push(Game.new(game['last_played_at'], game['multiplayer'], game['publish_date']))
    end
  end
end
