class Asset < ActiveRecord::Base

  # i imagine that there could be many sources if the sources were different 
  # sizes, etc of the same asset
  has_many :sources

  def remote
    @remote_asset ||= RemoteAsset.find(remote_id) unless remote_id.blank?
  end

end
