class ImprovementPlan < ApplicationRecord
  # Direct associations

  belongs_to :coach

  has_many   :goals,
             :foreign_key => "plan_id",
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
