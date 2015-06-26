require 'open-uri'

class Drug < ActiveRecord::Base

	attr_reader :target_name
	attr_reader :pchem_result

	def Drug.search(target_name)
		Drug.new

		pchem_result = open("https://pubchem.ncbi.nlm.nih.gov/rest/pug/assay/target/proteinname/#{target_name}/XML")
	end
end