class ProfessorDread::API
    attr_reader :details

    def fetch
        url = "https://pokeapi.co/api/v2/pokemon?limit=300"
        response = HTTParty.get(url)
        response["results"].each do |poke|
        name = poke["name"]
        url = poke["url"]
        ProfessorDread::POKE.new(name,url)
        end
        #binding.pry
    end
    
    def details(poke)
        url = poke.url
        response = HTTParty.get(url)
        response["abilities"].each {|pa| poke.abilities << pa["ability"]["name"]}
        response["types"].each {|pt| poke.types << pt["type"]["name"]}
        response["game_indices"].each {|pg| poke.game_indices << pg["version"]["name"]}
        response["moves"].each {|pm| poke.moves << pm["move"]["name"]}
        poke.weight = response["weight"]
        poke.height = response["height"]
        #binding.pry
        #bilities = nil
        #game_indices = nil


        #binding.pry
        #response.each do |detail,value| 
            #binding.pry
            #bilities = detail[1].map {|key| key["ability"]["name"]}
            #game_indices << detail[1].map {|key| key["game_indices"]["game_index"]["version"]["name"]}
            #height = detail ["height"]
            #weight = detail ["weight"] 
            #binding.pry
            #tpyes << details ["types"]["type"]["name"]
            #held_items = detail ["held_items"]
            
            #ProfessorDread::POKE.new
            #binding.pry
    end

    #def get_pokemon
     #   details.collect {|pk| pk.name}.flatten
     #     url = "https://pokeapi.co/api/v2/generation"
    #end
end




    