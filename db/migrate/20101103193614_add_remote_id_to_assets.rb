class AddRemoteIdToAssets < ActiveRecord::Migration
  def self.up
    add_column :assets, :remote_id, :int
  end

  def self.down
    remove_column :assets, :remote_id
  end
end
