# This module provides some basic methods with the Viziframe application.
#
# Author::    Al Kivi <al.kivi@vizitrax.com>
# License::   MIT
class MainController < BaseController

  def index
    @lwidth = '15%'
    @rwidth = '10%'
    @height = '600'
    @title = 'Welcome to Vizimusic!'
    @composers = Composer.filter.all.sort_by do |composer|
      [composer.last_name, composer.first_name, composer.middle_name]
    end
    @instruments = Instrument.filter.order(:name).all
    @periods = Work.all_periods
    @c = User[:email=>session[:email]]
  end
  
  def show_period(id)
    @lwidth = '15%'
    @rwidth = '10%'
    @height = '600'
    @period = id
    works = Work.filter.all do |work|
      (work.period == @period) || (work.century == @period)
    end
    @editions = Edition.of_works(works)
  end

  def about
    unless logged_in?
      flash[:message] = 'You must login first to see the requested page'
      redirect('users/login')
    end
    @lwidth = '0%'
    @rwidth = '20%'
    @height = '600'
    @title = 'Welcome to the About page!'
  end

  # the string returned at the end of the function is used as the html body
  # if there is no template for the action. if there is a template, the string
  # is silently ignored
  def notemplate
    @title = 'Welcome to Viziframe!'
    
    return 'There is no template associated with this action.'
  end
end
