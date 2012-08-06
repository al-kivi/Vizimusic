# The Post class is the model for managing posts.
#
# Author:: Yorick Peterse  -  License:: MIT

class Post < Sequel::Model
  # The timestamps plugin is used to automatically fill two database columns
  # with the dates on which an object was created and when it was modified.
  plugin :validation_helpers
  plugin :timestamps, :create => :created_at, :update => :updated_at

  # Multiple posts can only belong to a single user.
  many_to_one :user
  one_to_many :comments

  ##
  # Post#validate() is called whenever an instance of this class is saved or
  # updated. 
  def validate
    validates_presence([:title, :body])
  end
end # Post
