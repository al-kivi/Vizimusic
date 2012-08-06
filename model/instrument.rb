# The Instrument class is the model for managing instruments in the R4RMusic application.
#
#
# Author:: David A. Black

class Instrument < Sequel::Model
  many_to_many :works
end # Instrument
