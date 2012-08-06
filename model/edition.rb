# The Edition class is the model for managing editions in the R4RMusic application.
#
#
# Author:: David A. Black

class Edition < Sequel::Model

  many_to_many :works
  one_to_many :orders
  many_to_one :publisher

  def Edition.of_works(works)
    works.map {|work| work.editions }.flatten.uniq
  end

  def composers
    works.map {|work| work.composer }.uniq
  end

# The edition might have a title of its own.  If not,
# fall back on the title of the first (and perhaps only)
# work in the edition.

  def nice_title
    (title || works[0].nice_title) + 
    " (#{publisher.name}, #{year})"
  end

end # Edition
