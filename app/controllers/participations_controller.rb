class ParticipationsController < ApplicationController
	before_action :logged_in_user

	def create
		participation = Participation.new()
	end

	def destroy
	end
end
