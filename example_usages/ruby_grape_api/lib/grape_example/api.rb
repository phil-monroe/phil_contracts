class GrapeExample::API < Grape::API
  version 'v1', using: :accept_version_header
  format :json

  content_type :json, 'application/json'
  default_error_formatter :json

  resource :foos do
    desc 'create a Foo'#, params: GrapeExample::ContractUtils.params_for_contract(PhilContracts::Foo)
    # TODO: figure out how to autogenerate/autoconfigure the declared params from a contract class.
    # something like:
    #
    #   desc 'creates a Foo', params: contract_params(PhilContracts::Foo)
    #
    # This is based on:
    # - https://github.com/ruby-grape/grape-entity#using-entities
    # - https://github.com/ruby-grape/grape/blob/master/lib/grape/dsl/desc.rb#L15
    params do
      requires :name, type: String
      optional :bar, type: JSON do
        requires :name, type: String
        requires :blah, type: String
      end
      optional :bars, type: Array[JSON] do
        requires :name, type: String
        requires :blah, type: String
      end
    end
    post '/' do
      puts "params: #{params.inspect}"

      foo = PhilContracts::Foo.new(declared(params))
      puts "new foo: #{foo.inspect}"

      present foo: foo, success: true
    end
  end

  add_swagger_documentation
end
