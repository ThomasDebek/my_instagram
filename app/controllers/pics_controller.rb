class PicsController < ApplicationController
   before_action :set_pic, only: %i[show edit update destroy]


	def index
		@pics = Pic.all 
	end

	def new
		@pic = Pic.new
	end

	def create
		@pic = Pic.new(pic_params)

		if @pic.save
			redirect_to @pic, notice: "Pic was sacessufuly created"
		else
			render 'new'
		end
	end

	def show
	end

	def edit
	end

	def update
	end

	def destroy
	end


	private

	def set_pic
		@pic = Pic.find(params[:id])
    end 

	def pic_params
		params.require(:pic).permit(:title, :description)
	end

end
