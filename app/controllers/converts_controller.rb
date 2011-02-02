class ConvertsController < ApplicationController

  def new

    unless params[:convert]
      @convert = Convert.new
    else
		  cookies[:timezone] = params[:convert][:timezone].clone
		  params[:convert][:timezone].gsub!(/:.+$/, '')
		  @convert = Convert.create(params[:convert])
		  @datetime = @convert.save
		  render :action => "new"
    end

  end

end
