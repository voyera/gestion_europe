# Cooperative is an association of multiple units
class Cooperative < ActiveRecord::Base
  has_many :units, dependent: :destroy
  # Needs validations so it's comform to the file structure
end
