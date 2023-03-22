require 'rspec'
require_relative 'item.rb'
require_relative 'music_album.rb'
require_relative 'genre.rb'

describe MusicAlbum do
  let(:album) { MusicAlbum.new('The Dark Side of the Moon', 'A classic album by Pink Floyd', 10.99, 'Pink Floyd', true) }

  it 'has a name' do
    expect(album.name).to eq('The Dark Side of the Moon')
  end

  it 'has a description' do
    expect(album.description).to eq('A classic album by Pink Floyd')
  end

  it 'has a price' do
    expect(album.price).to eq(10.99)
  end

  it 'has an artist' do
    expect(album.artist).to eq('Pink Floyd')
  end

  it 'is on Spotify' do
    expect(album.on_spotify).to eq(true)
  end

  it 'can be archived if it is not archived and is on Spotify' do
    allow(album).to receive(:archived?).and_return(false)
    expect(album.can_be_archived?).to eq(true)
  end

  it 'cannot be archived if it is already archived' do
    allow(album).to receive(:archived?).and_return(true)
    expect(album.can_be_archived?).to eq(false)
  end

  it 'cannot be archived if it is not on Spotify' do
    allow(album).to receive(:archived?).and_return(false)
    album.on_spotify = false
    expect(album.can_be_archived?).to eq(false)
  end
end

describe Genre do
  let(:genre) { Genre.new('Rock') }
  let(:album) { MusicAlbum.new('Back in Black', 'The seventh studio album by AC/DC', 9.99, 'AC/DC', true) }

  it 'has a name' do
    expect(genre.name).to eq('Rock')
  end

  it 'has a collection of items' do
    expect(genre.items).to eq([])
  end

  it 'can add an item to its collection' do
    genre.add_item(album)
    expect(genre.items).to eq([album])
    expect(album.genre).to eq(genre)
  end
end
