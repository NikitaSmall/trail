require 'spec_helper'

RSpec.describe Trail do
  let(:example_url) { 'http://example.com' }

  it 'has a version number' do
    expect(Trail::VERSION).not_to be nil
  end

  it 'has `nil` configuration by default' do
    expect(Trail.config).to be nil
  end

  it 'can be configured' do
    Trail.configure do |config|
      config.base_url = example_url
    end

    expect(Trail.config.base_url).to eq(example_url)
  end
end
