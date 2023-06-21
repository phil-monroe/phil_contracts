# frozen_string_literal: true

RSpec.describe PhilContracts do
  it "has a version number" do
    expect(PhilContracts::VERSION).not_to be nil
  end

  it "does something useful" do
    foo = PhilContracts::Foo.new(name: "Phil", bar: {name: "baz"}, bars: [{name: "one"}, {name: "two"}])

    expect(foo).to be_kind_of PhilContracts::Foo
    expect(foo.name).to eq "Phil"

    # bar
    expect(foo.bar).to be_kind_of PhilContracts::Foo::Bar
    expect(foo.bar.name).to eq "baz"

    # bars
    foo.bars.each do |bar|
      expect(bar).to be_kind_of PhilContracts::Foo::Bar
    end
    expect(foo.bars.first.name).to eq "one"
    expect(foo.bars.last.name).to eq "two"
  end
end
