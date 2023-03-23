require_relative '../game'

describe Game do
    before :each do
        @game = [Game.new('2012-05-02', true, '2010-05-02'), Game.new('2012-05-02', true, '2010-05-02')]
    end

    it 'should be an instance of Game class' do
        @game.each do |game|
            expect(game).to be_an_instance_of(Game)
        end
    end
    
    it 'should be an instance of Item' do
        @game.each do |game|
            expect(game).to be_kind_of(Item)
        end
    end
    
    it 'should have a last played at' do
        @game.each do |game|
            expect(game.last_played_at).to eq('2012-05-02')
        end
    end
    
    it 'should have a multiplayer' do
        @game.each do |game|
            expect(game.multiplayer).to eq(true)
        end
    end
    
    it 'should have a publish date' do
        @game.each do |game|
            expect(game.publish_date).to eq('2010-05-02')
        end
    end
    
    it 'should be able to be archived' do
        can_be_archived = @game[0].send(:can_be_archived?)
        expect(can_be_archived).to eq(true)
    end
    end