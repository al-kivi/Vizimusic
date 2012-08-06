# This module supports RSS Feeds for a blog application written in Ramaze
#
# Author:: Yorick Peterse  -  License:: MIT

class Rssfeeds < BaseController
  map '/rssfeeds'
  
  layout :default
  helper :xhtml, :paginate
  engine :etanni

  # Sets the content type and view name based on the extension in the URL. For
  # example, a request to /posts/feed.rss would render the view feed.rss.xhtml
  # and set the content type to application/rss+xml.
  provide(:atom, :type => 'application/atom+xml') do |action, body|
    # Disable the layout.
    action.layout = false

    # Let's make sure the body is actually rendered. Using "return" would cause
    # a local jumper error.
    body
  end

  ##
  # Returns a list of all posts as either an RSS feed or an Atom feed.
  def feed
    @posts = Post.all

    render_view(:feed)
  end
end # Rssfeeds
