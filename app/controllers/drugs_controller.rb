require 'open-uri'

class DrugsController < ApplicationController

	def index
		if params[:term].nil?
			render :search
			return
		end

		@drugs=Drug.search(params[:term])
	end

	def show
		@drug = Drug.new('', params[:drug_id])
		@drug.fetch
	end

end
