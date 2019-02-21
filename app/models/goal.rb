class Goal < ApplicationRecord
  # Direct associations

  has_many   :action_steps,
             :dependent => :destroy

  belongs_to :plan,
             :class_name => "ImprovementPlan"

  # Indirect associations

  # Validations

end
