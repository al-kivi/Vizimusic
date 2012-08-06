# This is the primary class for a blog application written in Ramaze
#
# Author:: Yorick Peterse  -  License:: MIT

class Posts < BaseController
  map '/posts'

  # These methods require the user to be logged in. If this isn't the case the
  # user will be redirected back to the previous page and a message is displayed.
  before(:edit, :new, :save, :delete) do
    # "unless logged_in?" is the same as "if !logged_in?" but in my opinion is a
    # bit nicer to the eyes.
    unless logged_in?
      flash[:error] = 'You need to be logged in to view that page'

      # Posts.r() is a method that generates a route to a given method and a set
      # of parameters.
      redirect(Posts.r(:index))
    end
  end

  ##
  # Shows an overview of all the posts that have been added. These posts are
  # paginated using the Paginate helper.
  def index
    @lwidth = '20%'
    @rwidth = '20%'
    @height = '800' 
    @posts = paginate(Post.eager(:comments, :user), :limit => 3)
    @title = 'Posts'
  end

  ##
  # Shows a single post along with all it's comments.
  def view(id)
    @lwidth = '20%'
    @rwidth = '20%'
    @height = '800' 
    @nofooter = true
    @post = Post[id]

    if @post.nil?
      flash[:error] = 'The specified post is invalid'
      redirect_referrer
    end

    @title       = @post.title
    @created_at  = @post.created_at.strftime('%Y-%m-%d')
    @new_comment = flash[:form_data] || Comment.new
  end

  ##
  # Allows users to create a new post, given the user is logged in.
  def new
    @lwidth = '20%'
    @rwidth = '20%'  
    @post  = flash[:form_data] || Post.new
    @title = 'New post'

    ## render_view(:form)   # Doesn't work properly with Haml
  end

  ##
  # Allows a user to edit an existing blog post.
  def edit(id)
    @lwidth = '20%'
    @rwidth = '20%'
    @post = flash[:form_data] || Post[id]

    # Make sure the post is valid
    if @post.nil?
      flash[:error] = 'The specified post is invalid'
      redirect_referrer
    end

    @title = "Edit #{@post.title}"

    ##  render_view(:form)  # Doesn't work properly with Haml
  end

  ##
  # Adds a new comment to an existing post and redirects the user back to the
  # post.
  def add_comment
    data    = request.subset(:post_id, :username, :comment)
    comment = Comment.new

    # If the user is logged in the user_id field should be set instead of the
    # username field.
    if logged_in?
      data.delete('username')
      data['user_id'] = user.id
    end

    begin
      comment.update(data)
      flash[:success] = 'The comment has been successfully added'
    rescue => e
      Ramaze::Log.error(e)

      flash[:form_errors] = comment.errors
      flash[:error]       = 'The comment could not be added'
    end

    redirect_referrer
  end

  ##
  # Saves the changes made by Posts#edit() and Posts#new(). While these two
  # methods could have their own methods for saving the data the entire process
  # is almost identical and thus this would be somewhat useless.
  def save
    redirect(Posts.r(:index)) if request.params['cancel'] == "Cancel"
#  Ramaze::Log.debug request
  
    # Fetch the POST data to use for a new Post object or for updating an
    # existing one.
    data            = request.subset(:title, :body)
    id              = request.params['id']
    data['user_id'] = user.id
    # If an ID is given it's assumed the user wants to edit an existing post,
    # otherwise a new one will be created.
    if !id.nil? and !id.empty?
      post = Post[id]

      # Let's make sure the post is valid
      if post.nil?
        flash[:error] = 'The specified post is invalid...'
        redirect_referrer
      end
      success = 'The post has been updated'
      error   = 'The post could not be updated'
    # Create a new post
    else
      post    = Post.new
      success = 'The post has been successfully created'
      error   = 'The post could not be created'
    end

    # Now that we have a Post object and the messages to display it's time to
    # actually insert/update the data. This is wrapped in a begin/rescue block
    # so that any errors can be handled nicely.
    begin
      # Post#update() can be used for both new objects and existing ones. In
      # case the object doesn't exist in the database it will be automatically
      # created.
      post.update(data)

      flash[:success] = success

      # Redirect the user back to the correct page.
      ## redirect(Posts.r(:edit, post.id))
      redirect(Posts.r(:index))   
    rescue => e
      Ramaze::Log.error(e)

      # Store the submitted data and the errors. The errors are used by
      # BlueForm, the form data is used so that the user doesn't have to
      # re-enter all data every time something goes wrong.
      flash[:form_data]   = post
      flash[:form_errors] = post.errors
      flash[:error]       = error

      redirect_referrer
    end
  end

  ##
  # Removes a single post from the database.
  def delete(id)
    # The call is wrapped in a begin/rescue block so any errors can be handled
    # properly. Without this the user would bump into a nasty stack trace and
    # probably would have no clue as to what's going on.
    begin
      Post.filter(:id => id).destroy
      flash[:success] = 'The specified post has been removed'
    rescue => e
      Ramaze::Log.error(e.message)
      flash[:error] = 'The specified post could not be removed'
    end
    redirect(Posts.r(:index))
  end
end # Posts
