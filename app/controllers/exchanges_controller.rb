class ExchangesController < ApplicationController
  before_action :logged_in_user, except: [:view]
  before_action :set_exchange, only: [:show, :edit, :update, :destroy, :assign]
  before_action :owner?, only: [:edit, :update, :destroy, :assign]


  def show
    @user = current_user
    @exchange = Exchange.find(params[:id])
    @owner = @exchange.owner
    @users = @exchange.users.paginate(page: params[:page], :per_page => 10)
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
    @users = @exchange.users.paginate(page: params[:page], :per_page => 10)
    render 'show_participants'
  end

  def open
  end

  #when an exchange is finished, it's important to close it - this means that no additional participations can occur. After this, the gifts will be distributed to the recievers.

  def close
    @exchange = Exchange.find(params[:id]) #TODO - move this repeating bit of code to a before filter
    #TODO - ensure that all gifts have been given.
    #TODO - deal with what happens if gifts are missing. Excise the users? Re-assign? That wouldn't work for 
    @exchange.close
    redirect_to @exchange
  end

  def gift
  end

  def join
  end

  def assign
    @exchange = Exchange.find(params[:id])
    #@exchange.locked = true
    if (@exchange.assign)
      @exchange.save
      flash[:success] = "Giftees assigned!"
    else
      #TODO: figure out how to raise the appropriate errors for each type of failure (not enough people, close date not reached)
      flash[:danger] = "Could not assign giftees: need at least 3 participants"
    end
    
    redirect_to @exchange
  end

  def close
    @exchange = Exchange.find(params[:id])
    if (@exchange.close)
      @exchange.save
      flash[:success] = "Exchange is closed, all gifts distributed!"
    else
      #TODO: fix this error message
      flash[:danger] = "Could not close the exchange; check logs for error"
    end

    redirect_to @exchange
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
    def exchange_params
      params.require(:exchange).permit(:name, :start, :end)
    end

    def set_exchange
      @exchange = Exchange.find_by(id: params[:id], owner: current_user)
    end

    def owner?
      debugger
      unless (@exchange && @exchange.owner.id == current_user.id)
        flash[:danger] = "Error processing your request"
        redirect_to exchanges_path
      end
    end
end
