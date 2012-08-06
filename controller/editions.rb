# This is the editions class for the R4rMusic application re-written in Ramaze
#
# Author:: David A. Black

class Editions < BaseController
  map '/editions'
#  helper :composer, :work

  def show(id)
    @lwidth = '20%'
    @rwidth = '0'
    @height = '600'
    @edition = Edition[id]
  end

end
