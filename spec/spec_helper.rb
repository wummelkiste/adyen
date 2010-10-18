require 'rubygems'

require 'rspec'

require 'adyen'
require 'adyen/matchers'

RSpec.configure do |config|
  config.include Adyen::Matchers
end
