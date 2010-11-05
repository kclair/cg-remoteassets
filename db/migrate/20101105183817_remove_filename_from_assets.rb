class RemoveFilenameFromAssets < ActiveRecord::Migration
  def self.up
    remove_column :assets, :filename
  end

  def self.down
    add_column :assets, :filename, :string
  end
end
