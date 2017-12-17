class GiveAwaysController < ApplicationController
  before_action :logged_in_user, except: [:view]
  before_action :set_give_away, only: [:show, :edit, :update, :destroy]


  def show
    @user = current_user
    @give_away = GiveAway.find_by(params[:id])
  end

  def index
    @user = current_user
    @give_aways = @user.give_aways
  end

  def new
  end

  def create
    @user = current_user
    @give_away = GiveAway.new(give_away_params)
    @give_away.owner = @user

    respond_to do |format|
      if @give_away.save
        flash[:success] = "Giveaway #{@give_away.name} created!"
        format.html {redirect_to @give_away}
        format.json { render :show, status: :created, location: @give_away }
      else
        format.html { render :new }
        format.json { render json: @give_away.errors, status: :unprocessable_entity }

      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @give_away.update(give_away_params)
        format.html { redirect_to @give_away}#, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @give_away }
      else
        format.html { render :edit }
        format.json { render json: @give_away.errors, status: :unprocessable_entity }
      end
    end
  end

  def open
  end

  def close
  end

  def gift
  end

  def join
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
    def give_away_params
      params.require(:give_away).permit(:name, :start, :end)
    end

    def set_give_away
      @give_away = GiveAway.find_by(id: params[:id], owner: current_user)
    end
end
