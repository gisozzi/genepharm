class DrugsController < ApplicationController

  def index
    if params[:target_name].nil?
      render :search
      return
    end

		# @drugs = [1,2,3]
    @drugs=Drug.search(params[:target_name])
  end

  def show
    @drug = Drug.new(params[:pchem_result])
    @pchem_results = Drug.pchem_result
  end
end
