# This file contains your application, it requires dependencies and necessary parts of 
# the application.
#
# It will be required from either `config.ru` or `start.rb`

require 'rubygems'

if ENV['RACK_ENV'] == 'production'
  Gem.clear_paths
  Gem.path.unshift('/home/vizitrax/.gems')
  require 'ramaze'
  Ramaze.options.mode = :live
else
  require 'ramaze'
  Ramaze.options.mode = :dev
end
Ramaze::Log.info('We start in %s mode' % Ramaze.options.mode.to_s)

require 'sequel'
## require 'haml'       # needed if haml is used

# Make sure that Ramaze knows where you are
Ramaze.options.roots = [__DIR__]

# Initialize controllers and models
require __DIR__('model/init')
require __DIR__('controller/init')
