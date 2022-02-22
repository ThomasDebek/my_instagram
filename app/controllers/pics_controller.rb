class PicsController < ApplicationController
	
before_action :authenticate_user!, except: %i[index]
	
   before_action :set_pic, only: %i[show edit update destroy]


	def index
		@pics = Pic.all.order("created_at DESC")
	end

	def new
		@pic = current_user.pics.build
	end

	def create
		@pic = current_user.pics.build(pic_params)

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
		if @pic.update(pic_params)
			redirect_to @pic, notice: "Pic sacessufly updated"
		else
			render 'edit'
		end
	end

	def destroy
	  @pic.destroy
	  redirect_to root_path, notice: 'Pic was sacessfuly deleted'
	end


	private

	def set_pic
      @pic = Pic.find(params[:id])
   end

	def pic_params
		params.require(:pic).permit(:title, :description)
	end

end
