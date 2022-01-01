# What I want my object model to look like.

class Starships
	@@all = []
	attr_accessor :name, :model, :manufacturer

	
	#def initialize(name, model, manufacturer)
	#	@name, @model, @manufacturer = name, model, manufacturer
	#	save
	#end

	def initialize(starships_hash)
		starships_hash.each do |k, v|
			self.send("#{k}=", v) if self.respond_to?("#{k}=")
		end
		save
	end

	def save
		@@all << self
	end

	def self.all
		@@all
	end

	def self.find_starship(name)
		self.all.find do |starship|
			starship.name == name
		end
	end
end