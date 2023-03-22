require_relative 'game'
require_relative 'author'

module NewItem
  def initialize
    @item_options = '0'
  end

  def item_options
    puts 'which item would you like to create?'
    puts '1. Add a Book'
    puts '2. Add a Music Album'
    puts '3. Add a Game'
  end

  def add_selected_item
    # @item_options = gets.chomp
    case @item_options
    when '1'
      create_book
    when '2'
      create_music_album
    when '3'
      create_game
    else
      puts 'Invalid Selection!.'
    end
  end

  def create_item
    until %w[1 2 3].include?(@item_options)
      item_options
      @item_options = gets.chomp
      add_selected_item
    end
    @item_options = '0'
  end

  def author_game
    list_authors
    print 'Select the author by number:'
    author_index = gets.chomp.to_i - 1
    @authors[author_index]
  end

  def create_game
    print 'Enter the last played at (yyy-mm-dd):'
    last_played_at = gets.chomp
    print 'Is It multiplayer(y/n):'
    multiplayer = gets.chomp.downcase
    multiplayer = multiplayer == 'y'
    print 'Enter the publish date (yyyy-mm-dd):'
    publish_date = gets.chomp
    game = Game.new(last_played_at, multiplayer, publish_date)
    author = author_game
    author.add_item(game)
    @games << game
    puts 'Game has been created.'
    puts '********************************'
  end
end
