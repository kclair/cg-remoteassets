class AddAssetItToSources < ActiveRecord::Migration
  def self.up
    add_column :sources, :asset_id, :integer
  end

  def self.down
    remove_column :sources, :asset_id
  end
end
