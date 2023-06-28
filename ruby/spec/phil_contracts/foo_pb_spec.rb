# frozen_string_literal: true

RSpec.describe PhilContracts::Foo do
  it "describes the foo.proto contract" do
    params = { name: "Phil", bar: {name: "baz"}, bars: [{name: "one"}, {name: "two"}] }
    data = PhilContracts::Foo.new(params)

    expect(data).to be_kind_of PhilContracts::Foo
    expect(data.name).to eq "Phil"

    # bar
    expect(data.bar).to be_kind_of PhilContracts::Foo::Bar
    expect(data.bar.name).to eq "baz"

    # bars
    data.bars.each do |bar|
      expect(bar).to be_kind_of PhilContracts::Foo::Bar
    end
    expect(data.bars.first.name).to eq "one"
    expect(data.bars.last.name).to eq "two"
  end

  it "does not like unknown params/attributes" do
    params = { name: "Phil", malicious_param: "muah ha ha!" }

    expect do
      PhilContracts::Foo.new(params)
    end.to raise_error(ArgumentError)
  end
end
