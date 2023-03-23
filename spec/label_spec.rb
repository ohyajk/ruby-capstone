require_relative '../label'
require_relative '../item'

describe Label do
  before :each do
    @label = [Label.new('Mega', 'red')]
  end

  it 'should be an instance of Label class' do
    @label.each do |label|
      expect(label).to be_an_instance_of(Label)
    end
  end

    it 'should have a title' do
    @label.each do |label|
      expect(label.title).to eq('Mega')
    end
  end

    it 'should have a color' do
    @label.each do |label|
      expect(label.color).to eq('red')
    end
  end
end

describe Item do
    it 'it should add an item to the label' do
        label = Label.new('Mega', 'red')
        book = Book.new('Mega', true, '2011-09-09')
        label.add_item(book)
        expect(label.items).to eq([book])
    end
    end