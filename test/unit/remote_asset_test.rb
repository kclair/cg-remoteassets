require File.dirname(__FILE__) + '/../test_helper'

class RemoteAssetTest < ActiveSupport::TestCase

  def test_create
    puts 'in test_create'
    asset = RemoteAsset.new(:asset=>{:mime_from => 'txt/html', :filename => 'foofile'}.to_json)
    asset.save
    assert_not_nil asset
  end

 def test_create_from_model
    @asset = assets(:one)
    @source = @asset.sources.find(1)
    # if i were a functional test i could call a controller that uses source_url but i'm not a functional controller
    url = "http://localhost:3000/source/#{@source.id}"
    remote = RemoteAsset.new(:asset => {:mime_from => @asset.mime_type, :filename => @source.filename, :source_url => url}.to_json)
    remote.save
    assert_not_nil remote
  end

end

