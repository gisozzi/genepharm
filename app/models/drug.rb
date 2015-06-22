require 'eutils'

class Drug < ActiveRecord::Base
	NCBI_DB = 'pccompound'

	attr_reader :target_name
	attr_reader :drug_id

	def initialize target, id
		@target_name = target
		@drug_id = id
	end

	def Drug.search(search_terms)
		eutils=Eutils.new("genepharm","sozzi.gianluca.gs@gmail.com")
		target_names = search_terms.split(',')

		result = {}
		target_names.each do |target|
			ncbi_result = eutils.esearch(target, NCBI_DB)

			result[target] = ncbi_result["IdList"]["Id"].map do |id|
				Drug.new(target, id)
			end
		end
	end

	def fetch
		pubchem_result = open_url("https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/cid/#{drug_id}/.../JSON")

		info_json = JSON.parse(pubchem_result)
	end

end
