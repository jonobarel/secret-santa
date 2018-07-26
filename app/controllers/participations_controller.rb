class ParticipationsController < ApplicationController
	before_action :logged_in_user

	def create
		@ex = Exchange.find(params[:exchange_id])
		current_user.join(@ex)
		redirect_to @ex

	end

	def destroy
		#TODO Check against enrollment cutoff date, so that user's giftee doesn't get left stranded.
		#TODO if the gift has already been assigned, then don't lose it!
		ex = Exchange.find(params[:exchange_id])
		current_user.leave(ex)
		redirect_to ex
	end

	def update
		participation = Participation.find(params[:id])
		if participation.nil?
			flash[:warning] = "Sorry, an unknown error occurred, information not updated"
		else

			if (participation.update(gift: params[:participation][:gift]))
				flash[:success] = "Hooray! Gift saved!"
			end
		end

		redirect_to current_user
	end

  #  def update
  #   respond_to do |format|
  #     if @exchange.update(exchange_params)
  #       format.html { redirect_to @exchange}#, notice: 'Exchange was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @exchange }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @exchange.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

end
