# The Order class is the model for managing orders in the R4RMusic application.
#
#
# Author:: David A. Black

class Order < Sequel::Model
  plugin :timestamps, :create => :created_at

  many_to_one :user
  many_to_one :edition

  def before_create
    self.status = "open"
  end
end
