class Ingredient < ApplicationRecord
  # Direct associations

  belongs_to :user

  has_many   :compositions,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
