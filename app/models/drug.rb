require 'open-uri'
require 'json'

class Drug < ActiveRecord::Base

	attr_reader :target_name
	attr_reader :pchem_result

	def Drug.search(target_name)
		Drug.new

		pchem_result = open("https://pubchem.ncbi.nlm.nih.gov/rest/pug/assay/target/proteinname/#{target_name}/JSON")
		JSON.parse(pchem_result.read)
	end
end
