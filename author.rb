class Author
    attr_accessor :first_name, :last_name, :items

    def initialize(first_name, last_name)
        @first_name = first_name
        @last_name = last_name
        @items = []
    end
end