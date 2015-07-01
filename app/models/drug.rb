require 'open-uri'
require 'json'

class Drug
	attr_accessor :properties

	def initialize(properties)
		self.properties = properties
	end
end
