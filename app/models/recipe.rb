class Recipe < ApplicationRecord
  # Direct associations

  has_many   :compositions,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
