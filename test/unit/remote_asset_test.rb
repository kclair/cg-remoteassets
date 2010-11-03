require File.dirname(__FILE__) + '/../test_helper'

class RemoteAssetTest < ActiveSupport::TestCase

  def test_create
    asset = RemoteAsset.new(:asset=>{:mime_type => 'txt/html', :filename => 'foofile'}.to_json)
    asset.save
    assert_not_nil asset
  end

end

