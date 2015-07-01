class AssaysController < ApplicationController

  def index
    if params[:target_name].nil?
      render :search
      return
    end

    @assays=Assay.search(params[:target_name])
  end
end
