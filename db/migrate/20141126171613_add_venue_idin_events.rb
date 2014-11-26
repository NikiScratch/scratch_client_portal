class AddVenueIdinEvents < ActiveRecord::Migration
  

    def self.up
        add_column :events, :venue_id, :integer
    end
    
    def self.down
        remove_column :events, :venue_id, :integer
        
    end
end