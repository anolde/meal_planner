class User < ApplicationRecord
  # Direct associations

  has_many   :recipes,
             :dependent => :destroy

  has_many   :compositions,
             :dependent => :destroy

  has_many   :restaurants,
             :dependent => :destroy

  has_many   :contacts,
             :dependent => :destroy

  has_many   :ingredients,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
