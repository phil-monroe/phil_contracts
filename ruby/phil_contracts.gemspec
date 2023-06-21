# frozen_string_literal: true

require_relative "lib/phil_contracts/version"

Gem::Specification.new do |spec|
  spec.name = "phil_contracts"
  spec.version = PhilContracts::VERSION
  spec.authors = ["Phil Monroe"]
  spec.email = ["phil@monroes.me"]

  spec.summary = "A quick test on how to create a contracts gem using protobuf messages."
  spec.description = "A quick test on how to create a contracts gem using protobuf messages."
  spec.homepage = "https://github.com/phil-monroe/phil_contracts"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage


  spec.files = Dir.chdir(__dir__) do
    Dir.glob(File.expand_path("lib/**/*.rb", __dir__))
  end

  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "google-protobuf", '~> 3.23'
end
