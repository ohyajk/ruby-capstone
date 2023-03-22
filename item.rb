require_relative 'date'

class Item
  attr_reader :id, :archived
  attr_accessor :genre, :author, :source, :label, :publish_date

  def initialize(genre, author, source, label, publish_date)
    @id = rand(1..1000)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = false
  end

  def can_be_archived?
    current_year = Date.today.year
    publish_year = @publish_date.year
    age_in_years = current_year - publish_year
    age_in_years > 10
  end

  def move_to_archive
    if can_be_archived?
      @archived = true
      puts 'Item has been moved to the archive.'
    else
      puts 'Item cannot be moved to the archive.'
    end
  end
end
