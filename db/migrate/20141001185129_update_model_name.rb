class UpdateModelName < ActiveRecord::Migration
  def self.up
    rename_table :eventvenues, :events_venues
  end

  def self.down
    rename_table :events_venues, :eventvenues
  end
end