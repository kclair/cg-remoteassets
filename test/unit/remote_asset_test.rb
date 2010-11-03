require File.dirname(__FILE__) + '/../test_helper'

require 'base64'

class RemoteAssetTest < ActiveSupport::TestCase

  def test_create
    puts 'in test_create'
    asset = RemoteAsset.new(:asset=>{:mime_type => 'txt/html', :filename => 'foofile'}.to_json)
    asset.save
    assert_not_nil asset
  end

  def test_create_from_model
    asset = assets(:one)
    source = Base64.encode64(asset.source)
    remote = RemoteAsset.new(:asset => {:mime_type => asset.mime_type, :filename => asset.filename, :source => source}.to_json)
    remote.save
    assert_not_nil remote
  end

end

