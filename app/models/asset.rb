class Asset < ActiveRecord::Base

  def remote
    @remote_asset ||= RemoteAsset.find(remote_id) unless remote_id.blank?
  end

  def source
    File.read("#{RAILS_ROOT}/public/assets/#{filename}")
  end

end
