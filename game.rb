require_relative 'item'

class Game < Item
  attr_accessor :last_played_at, :multiplayer
  attr_reader :publish_date

  def initialize(last_played_at, multiplayer, publish_date)
    super(publish_date)
    @last_played_at = last_played_at
    @multiplayer = multiplayer
  end

  def can_be_archived
    super || Date.today > Date.iso8601(@last_played_at).next_year(2)
  end
end
