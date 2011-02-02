class ConvertsController < ApplicationController

  def new
    @convert = Convert.new
  end

  def create
		cookies[:timezone] = params[:convert][:timezone].clone
		params[:convert][:timezone].gsub!(/:.+$/, '')

		@convert = Convert.create(params[:convert])
		@datetime = @convert.save

		render :action => "new"
  end

end
