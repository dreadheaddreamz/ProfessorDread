class ProfessorDread::POKE
    attr_accessor :name, :url, :game_indices, :weight, :height, :abilities, :types, :moves

    @@all = []

    #each Pokemon instanciated has a name, game index, weight, height, abilities, types, and held items

    def initialize(name,url)
        #creates a new object with a array of attributes
        @name = name
        @url = url
        @weight = weight
        @height = height
        @abilities = []
        @game_indices = []
        @moves = []
        @types = []
        @@all << self
    end

    def get_type
        types.each {|type| puts type}
    end

    def get_game_indices
        game_indices.each {|game| puts game}
    end

    def get_moves
        moves.each {|move| puts move} 
    end

    def get_abilities
        abilities.each {|abilities| puts abilities}
    end

    def self.all
        @@all
    end

end