# Communicate b/w user & data

class CLI
	def start
		API.get_data
		puts "Welcome to the Starships Lot, shopping for a new starship?"
		puts "Let's start with your name:"
		greet(user_input)
	end

	def user_input
		gets.strip
	end

	def greet(name)
		puts "Awesome #{name}, would you like to see our starships?(y/exit)"
		menu
	end

	def list_starships
		Starships.all.each.with_index(1) do |starship, index|
			puts "#{index}: #{starship.name}"
		end
		select_starship
	end

	def select_starship
		puts "Select a starship for more details:"

		selection = user_input

		# query starship class to find starship details.
		starship = Starships.find_starship(selection)
		starship_details(starship)
	end

	def starship_details(starship)
		puts "Name: #{starship.name}"
		puts "Model: #{starship.model}"
		puts "Manufacturer: #{starship.manufacturer}"

		menu
	end

	def goodbye
		puts "Hopefully you'll come back but, bye for now!"
	end

	def invalid
		puts "Hmm, that doesn't seem valid, try again?"
		menu
	end

	def menu
		selection = user_input
		if selection == 'y'
			list_starships
			menu
		elsif selection == 'exit'
			goodbye
		else
			invalid
		end	
	end
end