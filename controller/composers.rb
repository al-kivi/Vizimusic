# This is the composer class for the R4rMusic application re-written in Ramaze
#
# Author:: David A. Black

class Composers < BaseController
  map '/composers'
##  helper :work, :edition

  def show(id)
    @lwidth = '20%'
    @rwidth = '0'
    @height = '600'
    @composer = Composer[id]
  end
  
end
