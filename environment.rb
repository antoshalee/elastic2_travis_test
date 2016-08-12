require 'elasticsearch'
require 'elasticsearch/persistence'

ES_HOST = 'localhost'
ES_PORT = 9310

Dir['app/*.rb'].each { |f| require_relative f }

