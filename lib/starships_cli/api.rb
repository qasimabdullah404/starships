# make api calls to https://swapi.dev/api/starships/

class API
	def self.get_data
		response = RestClient.get('https://swapi.dev/api/starships/')
		starships_array = JSON.parse(response)["results"]
		starships_array.each do |starship|
			Starships.new(starship)
		end
	end
end