require File.dirname(__FILE__) + '/../test_helper'

class RemoteAssetTest < ActiveSupport::TestCase

  def test_create
    asset = RemoteAsset.create(:mime_from => 'txt/html', :filename => 'foofile')
    assert_not_nil asset
  end

 def test_create_from_model
    @asset = assets(:one)
    @source = @asset.sources.find(1)
    # if i were a functional test i could call a controller that uses source_url but i'm not a functional controller
    url = "http://localhost:3000/source/#{@source.id}"
    remote = RemoteAsset.create(:mime_from => @asset.mime_type, :filename => @source.filename, :source_url => url)
    assert_not_nil remote

    # do a simple get to verify that the model is loading normally 
    show_asset = RemoteAsset.find(remote.id)
    assert_equal @asset.mime_type, show_asset.mime_from
  end

  def test_remote_asset_queued
    @asset = assets(:one)
    @source = @asset.sources.find(1)
    url = "http://localhost:3000/source/#{@source.id}"
    remote = RemoteAsset.create(:mime_from => @asset.mime_type, :filename => @source.filename, :source_url => url)
    assert_not_nil remote
    remote.reload
    assert remote.status, 'newly created remote asset should get a status"'
  end

  def test_remote_asset_invalid_source
    @asset = assets(:one)
    remote = RemoteAsset.create(:mime_from => @asset.mime_type, :filename => 'foo', :source_url => 'http://foobar')
    assert_not_nil remote
    count = 0
    until count == 30
      remote.reload
      break if remote.status == 'failed'
      count = count+1
      sleep 1
    end
    assert remote.status == 'failed', 'asset with invalid source url should fail'
  end

  def test_remote_asset_processed
    @asset = assets(:one)
    @source = @asset.sources.find(1)
    url = "http://localhost:3000/source/#{@source.id}"
    remote = RemoteAsset.create(:mime_from => @asset.mime_type, :filename => @source.filename, :source_url => url)
    assert_not_nil remote
    # give it 30 seconds to finish
    count = 0
    until count == 30
      remote.reload
      break if remote.status == 'succeeded'
      count = count+1
      sleep 1
    end
    assert remote.status == 'succeeded', 'asset with valid source url should succeed'
  end

end

