# This is the works class for the R4rMusic application re-written in Ramaze
#
# Author:: David A. Black

class Works < BaseController
  map '/works'
#  helper :edition, :composer

  def show(id)
    @lwidth = '20%'
    @rwidth = '0'
    @height = '600'
    @work = Work[id]
  end

end
