require 'spec_helper'

RSpec.describe Trail::Client do
  let(:base_url) { 'https://httpbin.org' }

  let(:username) { 'example_user' }
  let(:password) { 'example_pass' }

  let(:get_url)  { '/get' }
  let(:post_url) { '/post' }

  let(:payload) { { 'text' => 'hello' } }

  before(:each) do
    Trail.configure do |config|
      config.base_url = base_url
      config.username = username
      config.password = password
      config.api_path = ''
    end
  end

  it 'can send get request' do
    data = Trail::Client.get(get_url, payload).data
    expect(data['args']).to eq(payload)
  end

  it 'can send post request' do
    data = Trail::Client.post(post_url, payload).data
    expect(data['form']).to eq(payload)
  end
end
