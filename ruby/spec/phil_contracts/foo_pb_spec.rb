# frozen_string_literal: true

RSpec.describe PhilContracts::Foo do
  it "describes the foo.proto contract" do
    data = PhilContracts::Foo.new(name: "Phil", bar: {name: "baz"}, bars: [{name: "one"}, {name: "two"}])

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
end
