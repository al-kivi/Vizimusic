# This is the instruments class for the R4rMusic application re-written in Ramaze
#
# Author:: David A. Black

class Instruments < BaseController
##  helper :work, :edition
  def show(id)
    @instrument = Instrument[id]
  end
end
