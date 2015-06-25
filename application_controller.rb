class ApplicationController < ActionController::Base

	def index
		if params[:target_name].nil?
			render :search
			return
		end

		@drugs=Drug.search(params[:target_name])
		
	end

	def show
		@drug = Drug.new(params[:pchem_result])
			render json: (Drug.pchem_result)
	end

end