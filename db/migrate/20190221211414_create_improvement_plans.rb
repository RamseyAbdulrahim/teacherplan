class CreateImprovementPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :improvement_plans do |t|
      t.integer :user_id
      t.string :status
      t.string :comments
      t.integer :coach_id

      t.timestamps
    end
  end
end
