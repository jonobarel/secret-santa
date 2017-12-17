class ChangeGiveAwaysToExchanges < ActiveRecord::Migration[5.1]
  def change
  	rename_table :give_aways, :exchanges
  end
end
