require 'webmock/rspec'
require 'awesome_print'

Dir.glob(File.join(File.dirname(__FILE__), 'support', '**', '*.rb')).each { |f| require f }

require 'sfpl-passes'
