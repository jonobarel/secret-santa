class ParticipationsController < ApplicationController
	before_action :logged_in_user

	def create
		@ex = Exchange.find(params[:exchange_id])
		current_user.join(@ex)
		redirect_to @ex

	end

	def update_gift
		@part = Participation.find(params[:participation][:id])
		@part.update(params[:participation][gift])
		@part.save
		redirect_to current_user
	end


	def destroy
		#TODO Check against enrollment cutoff date, so that user's giftee doesn't get left stranded.
		#TODO if the gift has already been assigned, then don't lose it!
		ex = Exchange.find(params[:exchange_id])
		current_user.leave(ex)
		redirect_to ex
	end
end
