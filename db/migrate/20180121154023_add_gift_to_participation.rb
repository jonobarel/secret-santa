class AddGiftToParticipation < ActiveRecord::Migration[5.1]
  def change
    add_column :participations, :gift, :string, index: true
  end
end
