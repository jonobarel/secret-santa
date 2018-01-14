class AddLockedToExchanges < ActiveRecord::Migration[5.1]
  def change
    add_column :exchanges, :locked, :boolean
  end
end
