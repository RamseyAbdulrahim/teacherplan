class CreateActionSteps < ActiveRecord::Migration[5.1]
  def change
    create_table :action_steps do |t|
      t.integer :goal_id
      t.string :timeline
      t.string :lead_persons
      t.string :resources_needed
      t.string :specifics_of_implementation
      t.string :measures_of_success

      t.timestamps
    end
  end
end
