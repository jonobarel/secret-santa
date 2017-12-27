class ParticipationsController < ApplicationController
	before_action :logged_in_user

	def create
		ex = Exchange.find(params[:exchange_id])
		current_user.join(ex)

	end

	def destroy
		ex = Exchange.find(params[:exchange_id])
		current_user.leave(ex)
	end
end
