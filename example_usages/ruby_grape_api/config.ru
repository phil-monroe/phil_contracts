$:.unshift File.expand_path('lib', __dir__)
require_relative 'lib/grape_example'

run GrapeExample::API
