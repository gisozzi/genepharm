class DrugsController < ApplicationController

  def index
    if params[:target_name].nil?
      render :search
      return
    end

    @drugs=Drug.search(params[:target_name])
  end

  def show
    @res = Drug.show(params[:property])
  end
end