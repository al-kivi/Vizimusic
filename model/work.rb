# The Work class is the model for managing works in the R4RMusic application.
#
# Author:: David A. Black

class Work < Sequel::Model

  many_to_one :composer
  many_to_many :instruments
  many_to_many :editions

  PERIODS = { [1650..1750, %w{ EN DE FR IT ES NL}] => "Baroque",
              [1751..1810, %w{ EN IT DE NL }]      => "Classical",
              [1751..1830, %w{ FR }]               => "Classical",
              [1837..1901, %w{ EN }]               => "Victorian", 
              [1820..1897, %w{ DE FR }]            => "Romantic" }

  def period
    pkey = PERIODS.keys.find do |yrange,countries|
      yrange.include?(year) && countries.include?(country)
    end
    PERIODS[pkey] || century
  end
  
  def century
    c = (year - 1).to_s[0,2].succ
    c += case c
        when "21" then "st"
        else "th"
        end
    c + " century"
  end

  def key
    kee
  end

  def nice_instruments
    instrs = instruments.map {|inst| inst.name }
    ordered = %w{ flute oboe violin viola cello piano orchestra }
    instrs = instrs.sort_by {|i| ordered.index(i) || 0 }
    case instrs.size
    when 0
      nil
    when 1
      instrs[0]
    when 2
      instrs.join(" and ")
    else 
      instrs[0...-1].join(", ") + ", and " + instrs[-1]
    end
  end

  def nice_title
    t,k,o,i = title, key, nice_opus, nice_instruments
    "#{title} #{"in #{k}" if k}#{", #{o}" if o}#{", for #{i}" if i}"
  end

  def nice_opus
    if /^\d/.match(opus)
      "op. #{opus}"
    else
      opus
    end
  end

  def publishers
    editions.map {|ed| ed.publisher }.uniq
  end

  def country
    composer.country
  end

# Class methods

  def Work.all_periods
#    find(:all).map {|c| c.period }.flatten.uniq.sort
    filter.all.map {|c| c.period }.flatten.uniq.sort
  end

  def Work.sales_rankings
    r = Hash.new(0) #1
#    find(:all).each do |work|
    filter.all.each do |work|    
      work.editions.each do |ed|
        r[work.id] += ed.orders.size
      end
    end
    r
  end
  
end # Work
