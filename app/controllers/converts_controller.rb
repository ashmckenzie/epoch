class ConvertsController < ApplicationController

  def method_missing(url)
    redirect_to :action => "new"
  end

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
