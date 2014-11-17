class RemoveFieldFromVenue < ActiveRecord::Migration
  def self.up
    remove_column :venues, :event_id
  end

  def self.down
    add_column :venues, :event_id, :integer
  end

end