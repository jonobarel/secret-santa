class AddStatusDescriptionToExchanges < ActiveRecord::Migration[5.1]
  def change
  	add_column :exchanges, :status, :string
  	add_column :exchanges, :enrollment_deadline, :datetime
  	add_column :exchanges, :enrollment_duration, :integer
  	add_column :exchanges, :completion_deadline, :datetime
  	add_column :exchanges, :completion_duration, :integer
  	add_column :exchanges, :cancel_date, :datetime
  end
end
