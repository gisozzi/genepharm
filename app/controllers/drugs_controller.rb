require 'open-uri'

class DrugsController < ApplicationController

	def index
		if params[:target_names].nil?
			render :search
			return
		end

		@drugs=Drug.search(params[:target_names])
		
	end

	def show
		@drug = Drug.new('', params[:drug_id])
			render json: drug_id
	end

end
