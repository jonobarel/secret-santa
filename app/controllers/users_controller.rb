class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  

  # GET /users
  # GET /users.json
  def index
    #@users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.includes(:exchanges).find(params[:id])
    @exchanges = @user.exchanges

    giving ={}
    receiving = {}
    Participation.all.where(user_id: @user).includes(:exchange).collect{|p| giving[p.exchange_id] = p}
    Participation.all.where(giftee_id: @user).includes(:exchange).collect{|p| receiving[p.exchange_id] = p}

    @participations = []

    #TODO - fix the logic for retrieving the received gift in a smarter way
    giving.collect{|i,p| @participations << {end_date: p.exchange.end, exchange: p.exchange, participation: p, part_as_giftee: receiving[p.exchange_id]}}

    @participations.sort {|x,y| x[:end_date] <=> y[:end_date]}
    #debugger

  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        log_in @user
        flash[:success] = "Welcome Secret Digital Santa!"

        format.html { redirect_to @user}#, notice: 'Welcome to Secret Digital Santa!' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user}#, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def gifts
    @user = User.find(params[:id])
    @gifts = @user.gifts
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)

    end
end
