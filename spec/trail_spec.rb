require "spec_helper"

RSpec.describe Trail do
  it "has a version number" do
    expect(Trail::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
