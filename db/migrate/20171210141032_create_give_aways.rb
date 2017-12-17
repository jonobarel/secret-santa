class CreateGiveAways < ActiveRecord::Migration[5.1]
  def change
    create_table :give_aways do |t|
      t.string :name
      t.integer :owner, index: true
      t.date :start
      t.date :end
      t.integer :min_members

      t.timestamps
    end

    create_table :users_giveaways, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :give_away, index: true
    end

  end
end
