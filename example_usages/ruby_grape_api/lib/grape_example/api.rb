class GrapeExample::API < Grape::API
  version 'v1', using: :accept_version_header
  format :json

  content_type :json, 'application/json'
  default_error_formatter :json

  resource :foos do
    desc 'create a foo'
    # TODO: figure out how to autogenerate/autoconfigure the declared params from a contract class.
    # something like:
    #
    # params do
    #   # NOTE: self == Grape::Validations::ParamsScope
    #   GrapeExample::ParamsContract.run(self, PhilContracts::Foo)
    # end
    params do
      requires :name, type: String
      optional :bar, type: Hash do
        requires :name, type: String
      end
      optional :bars, type: Array[JSON] do
        requires :name, type: String
      end
    end
    post '/' do
      puts "params: #{params.inspect}"

      foo = PhilContracts::Foo.new(declared(params))
      puts "new foo: #{foo.inspect}"

      present foo: foo, success: true
    end
  end
end
