class Goal < ApplicationRecord
  # Direct associations

  belongs_to :plan,
             :class_name => "ImprovementPlan"

  # Indirect associations

  # Validations

end
