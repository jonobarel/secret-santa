class CreateParticipations < ActiveRecord::Migration[5.1]
  def change
    create_table :participations do |t|
      t.integer :user_id, index: true
      t.integer :exchange_id, index: true
      t.string :secret_name
      t.integer :giftee_id, index: true

      t.timestamps
    end
  end
end
