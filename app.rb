require_relative 'author'
require_relative 'create_items'
require_relative 'list_items'
require_relative 'game_json'
require 'json'

class App
  include NewItem
  include ListItems
  include GameData

  def initialize
    @games = []
    @authors = [Author.new('Teklay', 'Birhane'), Author.new('Jitender', 'Kumar'),
                Author.new('Hounda ', 'Mzari')]

    @options = {
      '1' => 'Create an Item',
      '2' => 'List all items.',
      '3' => 'List all genres.',
      '4' => 'List all labels.',
      '5' => 'List all authors.',
      '6' => 'Exit'
    }
  end

  def run
    load_game_data
    puts 'Welcome to the Catalog App!'
    puts '********************************'
    loop do
      puts 'Please choose an your option:'
      @options.each do |key, value|
        puts "#{key}. #{value}"
      end
      option = gets.chomp
      case option
      when '1'
        create_item
      when '2'
        list_items
      when '3'
        list_genres
      when '4'
        list_labels
      when '5'
        list_authors
      when '6'
        exit
      else
        puts 'Invalid option.'
      end
    end
  end

  def exit
    save_game_data
    puts 'Thank you for using the Catalog App!'
    puts '********************************'
    Kernel.exit
  end
end
