class GiveAwaysController < ApplicationController
  def index
    @give_aways = GiveAways.find_by_owner(:user )
  end

  def new
  end

  def open
  end

  def close
  end

  def gift
  end

  def join
  end
end
