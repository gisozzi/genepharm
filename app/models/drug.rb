require 'eutils'

class Drug < ActiveRecord::Base

	def initialize
	@drug=Eutils.new("genepharm","sozzi.gianluca.gs@gmail.com")
	end

	def search
		Drug.search=drug.esearch=(params[:term][:db])
		params[:term]=""
		params[:db]="pccompound"
	end

	def fetch
		Drug.fetch=drug.results=(params[:list])
			params[:list]=@drug.search["IdList"]["Id"]*","
	end

end