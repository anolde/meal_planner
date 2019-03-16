class Composition < ApplicationRecord
  # Direct associations

  belongs_to :ingredient

  belongs_to :recipe

  # Indirect associations

  # Validations

end
