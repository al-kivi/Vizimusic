# Configure Sequel. This example uses a SQLite3 database.

DB = Sequel.sqlite('db/music.sqlite') if defined?(DB).nil?

Sequel.extension :pagination

# Sequel::Model.raise_on_save_failure = true

# This file is used for loading all your models. Note that you don't have to actually use
# this file. The great thing about Ramaze is that you're free to change it the way you see
# fit.

# Here go your requires for models:
require __DIR__('user')
require __DIR__('post')
require __DIR__('comment')
# R4RMusic application
require __DIR__('work')
require __DIR__('composer')
require __DIR__('instrument')
require __DIR__('edition')
require __DIR__('publisher')
require __DIR__('order')
