# The Composer class is the model for managing composers in the R4RMusic application.
#
# Author:: David A. Black

class Composer < Sequel::Model
  one_to_many :works

  def publishers
    works.editions.publishers.uniq
  end

  def whole_name
    "#{first_name} #{middle_name} #{last_name}"
  end

  def editions
    works.map {|work| work.editions }.flatten.uniq
  end

  def Composer.sales_rankings
    r = Hash.new(0)
    Work.sales_rankings.map do |work,sales|
      r[work.composer.id] += sales
    end
    r
  end
  
end # Composer
