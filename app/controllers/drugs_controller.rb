require 'open-uri'

class DrugsController < ApplicationController

	def index
		@drugs=Drug.search(params[:term])
		end

	def show
		@drugs=Drug.fetch(params[:list])
		open=("https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/cid/" +[:list] +"PNG")
	end

end