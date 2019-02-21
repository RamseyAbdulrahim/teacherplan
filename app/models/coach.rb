class Coach < ApplicationRecord
  # Direct associations

  has_many   :improvement_plans,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
