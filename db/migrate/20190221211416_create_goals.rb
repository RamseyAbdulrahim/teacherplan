class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.string :comments
      t.string :description
      t.integer :plan_id

      t.timestamps
    end
  end
end
