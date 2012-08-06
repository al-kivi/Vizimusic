# This is the orders class for the R4rMusic application re-written in Ramaze
#
# Author:: David A. Black

class Orders < BaseController
  map '/orders'
#  helper :composer, :work

  def show(id)
    @lwidth = '20%'
    @rwidth = '0'
    @height = '600'
    @order = Order[id]
  end

end
