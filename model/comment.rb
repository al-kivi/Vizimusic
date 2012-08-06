# The Comment class is the model for managing comments.
#
# Author:: Yorick Peterse  -  License:: MIT

class Comment < Sequel::Model
  # A comment can belong to only one post and one user
  many_to_one :post
  many_to_one :user
  
  plugin :timestamps, :create => :created_at, :update => :updated_at
  plugin :validation_helpers

  ##
  # Validates a comment before saving it to the database.
  #
  # @since  26-09-2011
  #
  def validate
    validates_presence(:comment)

    # Comments can either have user ID or a custom name. The user ID is only set
    # when the user is logged in.
    unless self.user_id
      validates_presence(:username)
    end
  end

  ##
  # Gets the name of the author from either an associated user or the "name"
  # field.
  #
  # @since  26-09-2011
  # @return [String]
  #
  def username
    if user and user.username
      return user.username
    else
      return super
    end
  end
end # Comment
