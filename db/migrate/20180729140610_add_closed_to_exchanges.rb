class AddClosedToExchanges < ActiveRecord::Migration[5.1]
  def change
    add_column :exchanges, :closed, :boolean  	
    add_column :exchanges, :close_date, :date
    add_column :exchanges, :lock_date, :date
  end
end
