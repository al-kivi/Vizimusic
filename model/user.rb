# The User class model is used for retrieving and authenticating users.
#
# Author:: www.justkez.com  -  License:: n/a

class User < Sequel::Model
  one_to_many :posts
  one_to_many :comments
  one_to_many :orders   # for music application only
  
  plugin :validation_helpers

  attr_accessor :password
  attr_accessor :password_confirmation

  def after_create
    self.crypted_password = encrypt(password)
    @new = false
    save
  end

  def authenticated?(password)
      crypted_password == encrypt(password)
  end

  def encrypt(password)
    self.class.encrypt(password, salt)
  end

  def self.encrypt(password, salt)
    Digest::SHA1.hexdigest("--#{salt}--#{password}--")
  end

  def self.authenticate(hash)
    email, pass = hash['email'], hash['password']

    if user = User[:email => email]
      return user unless pass
      user if user.authenticated?(pass)
    end
  end
  
  def validate
    validates_unique(:email, :message => 'Email address is already in use.')
    validates_format(/^.+@.+$/, :email, :message => 'Email address is not properly formatted.') if self.email != 'admin'

    validates_min_length(6, :password, :message => 'Password must be at least 6 characters.')

    validates_presence(:username, :message => 'Please enter a username.')
    validates_unique(:username, :message => 'Username is already in use.')   
  end
  
  # The following methods relate to the R4RMusic application
  def open_orders
    orders.find_all{|item| item.status =='open'}
  end

  def editions_on_order
    open_orders.map {|order| order.edition }.uniq
  end

  def edition_history
    orders.map {|order| order.edition }.uniq
  end

  def works_on_order
    editions_on_order.map {|edition| edition.works }.flatten.uniq
  end

  def work_history
    edition_history.map {|edition| edition.works }.flatten.uniq
  end

  def copies_of(edition)
    open_orders.select {|order| order.edition == edition } .size
  end

  def balance
    editions_on_order.inject(0) {|acc,edition| acc += edition.price }
  end

  def checkit_out
    orders.each do |order|
      order.status = "paid"
      order.save
    end
  end

  def rank(list)
    list.uniq.sort_by do |a|
      list.select {|b| a == b }.size
    end.reverse
  end

  def composer_rankings
    rank(edition_history.map {|ed| ed.composers }.flatten)
  end

  def instrument_rankings
    rank(work_history.map {|work| work.instruments }.flatten)
  end

  def favorites(thing,options)
    limit = options[:count]
    rankings = send("#{thing}_rankings")
    return rankings[0,limit].compact
  end
  
end # User
