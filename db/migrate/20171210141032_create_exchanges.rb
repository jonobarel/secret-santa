class CreateExchanges < ActiveRecord::Migration[5.1]
  def change
    create_table :exchanges do |t|
      t.string :name
      t.integer :owner_id, index: true
      t.date :start
      t.date :end
      t.integer :min_members

      t.timestamps
    end

  end
end
