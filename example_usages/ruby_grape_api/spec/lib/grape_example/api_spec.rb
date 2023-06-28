# frozen_string_literal: true
# typed: false

require 'spec_helper'

RSpec.describe(GrapeExample::API) do
  include Rack::Test::Methods

  def app
    GrapeExample::API
  end

  it "can create a simple foo" do
    request_body = {
      name: "Phil"
    }

    response = post("/foos",  request_body)
    response_body = process_response(response)

    expect(response_body.dig(:foo)).to be_present
    expect(response_body.dig(:foo, :name)).to eq("Phil")
  end

  it "can create a foo with some bars" do
    request_body = {
      name: "Phil",
      bar: {  name: "baz" },
      bars: [
        { name: "one" },
        { name: "two" }
      ]
    }

    response = post("/foos",  request_body)
    response_body = process_response(response)

    expect(response_body.dig(:foo)).to be_present
    expect(response_body.dig(:foo, :bar, :name)).to eq("baz")
    expect(response_body.dig(:foo, :bars, 0, :name)).to eq("one")
    expect(response_body.dig(:foo, :bars, 1, :name)).to eq("two")
  end

  it "only references the \"declared\" params to ignore unknown param" do
    request_body = {
      name: "Phil",
      malicious_param: "muah ha ha!"
    }

    expect do
      post("/foos",  request_body)
    end.to_not raise_error

    response_body = process_response(last_response)

    expect(response_body.dig(:foo)).to be_present
  end

  def process_response(response)
    body = parse_json(response.body)
    puts "response: #{body}"

    body
  end

  def parse_json(string)
    JSON.parse(string, symbolize_names: true)
  end
end
