require 'bundler/setup'

require 'grape'
require 'phil_contracts'

module GrapeExample
  autoload :API, 'grape_example/api'
end
