# frozen_string_literal: true

require_relative "phil_contracts/version"
require 'google/protobuf'

module PhilContracts
  CONTRACTS_PATH = File.expand_path("../phil_contracts/**/*_pb.rb", __FILE__)
end

# autoload all contracts
Dir.glob(PhilContracts::CONTRACTS_PATH).each do |path|
  require path
end
