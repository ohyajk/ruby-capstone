require_relative '../author'
require_relative '../item'

describe Author do
  before :each do
    @author = [Author.new('Teklay', 'Birhane')]
  end

  it 'should be an instance of Author class' do
    @author.each do |author|
      expect(author).to be_an_instance_of(Author)
    end
  end

  it 'should have a first name' do
    @author.each do |author|
      expect(author.first_name).to eq('Teklay')
    end
  end

  it 'should have a last name' do
    @author.each do |author|
      expect(author.last_name).to eq('Birhane')
    end
  end
end

describe Item do
  it 'it should add an item to the author' do
    author = Author.new('Teklay', 'Birhane')
    book = Book.new('Mega', true, '2011-09-09')
    author.add_item(book)
    expect(author.items).to eq([book])
  end
end
