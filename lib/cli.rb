class ProfessorDread::CLI
    attr_reader :api
    def call
        @api = ProfessorDread::API.new
        @api.fetch
        #binding.pry
        start
        show_pokemon
        poke_choice
        another_poke
        # chosen_poke
    end 
    
    def start
        puts <<-DISPLAY
        "________________________________"
        "                                "
        "|                              |"
        "|  Welcome to Dreads Pokédex!  |"
        "|                              |"
        "                                "
        "________________________________"
        DISPLAY
        sleep(2)

        end

    def show_pokemon
        @pokemon = ProfessorDread::POKE.all.each.with_index(1) do |pokemon, index|
          puts  "#{index} : #{pokemon.name}"
        end
    end

    def get_details(input)
        #binding.pry
        @pk = @pokemon.find do |poke|
        poke.name == input
        end
        #binding.pry
        @api.details(@pk)
       #binding.pry
    end

    
    def poke_choice
        puts "What Pokémon would you like data on?"
        input = gets.chomp
        if valid?(input)
            puts "Here is the requested data on #{input.upcase}"
            get_details(input)
            display_pokemon(@pk)
        else
            input != @pk
            puts "Enter end to exit"
            sleep(2)
        end
    end

  
    def valid?(input)
        if !@pokemon.find { |poke| poke.name == input}
            puts "Please enter a valid Pokémon name"
        elsif input == "end"
            exit_text
            sleep(2)
        else
            true
            
        end
    end



    def display_pokemon(pke)
        #binding.pry
        sleep(1)
        puts "Pokémon: #{pke.name}"
        puts "Height: #{pke.height}"
        puts "Weight: #{pke.weight}"
        display_data(pke)
    end

    def display_data(poke)
        puts "Would you like to know more data on #{poke.name}"
        puts "Please enter Types, Moves, Abilities, or Version for more info"
        puts "If you'd like to exit enter exit"
        input = gets.chomp.downcase
        case input 
        when "types" 
            poke.get_type
            display_data(poke)

        when "abilities"
            poke.get_abilities
            display_data(poke)

        when "moves"
            poke.get_moves
            display_data(poke)
        when "version"
            poke.get_game_indices
            display_data(poke)

        when "exit"
            exit_text

        else
            puts "Invalid input please try again"
            display_data(poke)
        end
    end

    def another_poke
        puts "Would you like data on another Pokémon yes or no?"
        input = gets.chomp
        if input == "yes"
            call
        else
            exit_text
        end
    end

    def exit_text
    puts "Thank You and good luck on your journey!"
    end

end
