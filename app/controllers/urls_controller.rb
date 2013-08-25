class UrlsController < ApplicationController
  
	def index
		@urls = Url.all
	end
  def new
  	@url = Url.new
  end

  def create
  	safe_url = params.require(:url).permit(:link)
  	@url = Url.new(safe_url)
  	@url.hash_code = rand(100000)
  	
  	if @url.save
  		redirect_to url_path(@url)
  	end
	end

  def show
  	@url = Url.find(params[:id])
  end

  def redirectors
  end

  def preview
  end
end
