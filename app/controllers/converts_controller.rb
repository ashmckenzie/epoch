class ConvertsController < ApplicationController

  def method_missing(url)
    redirect_to :action => "new"
  end

  def new
    @convert = Convert.new
  end

  def create

		cookies[:timezone] = params[:convert][:timezone].clone

		if params[:convert] and params[:convert][:timezone].gsub!(/:.+$/, '')

			@convert = Convert.new(params[:convert])
			@datetime = @convert.save

		end

		render :action => "new"

  end

end
