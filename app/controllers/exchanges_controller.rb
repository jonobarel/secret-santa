class ExchangesController < ApplicationController
  before_action :logged_in_user, except: [:view]
  before_action :set_exchange, only: [:show, :edit, :update, :destroy]


  def show
    @user = current_user
    @exchange = Exchange.find(params[:id])
  end

  def index
    @user = current_user
    @exchanges = @user.exchanges
  end

  def new
    @exchange = Exchange.new
  end

  def create
    
    @exchange = Exchange.new(exchange_params)
    @exchange.owner = current_user
    

    respond_to do |format|
      if @exchange.save
        flash[:success] = "Exchange #{@exchange.name} created!"
        format.html {redirect_to @exchange}
        format.json { render :show, status: :created, location: @exchange }
      else
        format.html { render :new }
        format.json { render json: @exchange.errors, status: :unprocessable_entity }

      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @exchange.update(exchange_params)
        format.html { redirect_to @exchange}#, notice: 'Exchange was successfully updated.' }
        format.json { render :show, status: :ok, location: @exchange }
      else
        format.html { render :edit }
        format.json { render json: @exchange.errors, status: :unprocessable_entity }
      end
    end
  end

  def participating
    @exchange = Exchange.find(params[:id])
    @owner = @exchange.owner
    @title = "#{@exchange.name} - participants"
    #@participants = @exchange.participations.paginate(page: params[:page])
    @users = @exchange.users.paginate(page: params[:page])
    render 'show_participants'
  end

  def join
    
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
    def exchange_params
      params.require(:exchange).permit(:name, :start, :end)
    end

    def set_exchange
      @exchange = Exchange.find_by(id: params[:id], owner: current_user)
    end
end
