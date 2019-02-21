class CreateCoaches < ActiveRecord::Migration[5.1]
  def change
    create_table :coaches do |t|
      t.integer :inviter_id
      t.integer :invitee_id

      t.timestamps
    end
  end
end
