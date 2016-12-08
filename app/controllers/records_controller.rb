class RecordsController < ApplicationController

	def index
    	@records = Record.all
    	@hash = Gmaps4rails.build_markers(@records) do |record, marker|
      		marker.lat record.latitude
      		marker.lng record.longitude
      	end
  	end

  	def new
  		@record = Record.new
  	end

  	def show
  	end

  	def edit
    	@record = Record.find(params[:id])
    end

	def create
		@record = Record.new(record_params)
  	
	  	if @record.save
  	    	redirect_to root_url
  	    else 
  	    	redirect_to root_url	
		end
	end

  	def update
  		@record = Record.find(params[:id])
  		
  		if @record.update(record_params)
  			redirect_to root_url
  		else
  			redirect_to root_url
  		end	
  	end	

  	def destroy
  		@record = Record.find(params[:id])
  		@record.destroy

  		redirect_to root_path
  	end	
 
	private
		def record_params
			params.require(:record).permit(:name, :location, :latitude, :longitude)
		end	

end
