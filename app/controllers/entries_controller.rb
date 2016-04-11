class EntriesController < ApplicationController
	respond_to :json

	def index
		respond_with Entry.all
	end

	def show
		respond_with Entry.find(params[:id])
	end

	def create
		respond_with Entry.create(params[:entry].permit(:name, :mobile_number))
	end

	def update
		respond_with Entry.update(params[:id], params[:entry].permit(:name, :mobile_number))
	end

	def destroy
		respond_with Entry.destroy(params[:id])
	end

end
