class Cooperative < ActiveRecord::Base
  has_many :units
  # Needs validations so it's comform to the file structure
end
