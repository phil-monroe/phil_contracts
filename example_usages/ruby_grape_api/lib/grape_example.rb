require 'bundler/setup'

require 'grape'
require 'grape-swagger'
require 'phil_contracts'

module GrapeExample
  autoload :API,           'grape_example/api'
  autoload :ContractUtils, 'grape_example/contract_utils'
end
