# The Publisher class is the model for managing publishers in the R4RMusic application.
#
#
# Author:: David A. Black

class Publisher < Sequel::Model
  one_to_many :editions
end
