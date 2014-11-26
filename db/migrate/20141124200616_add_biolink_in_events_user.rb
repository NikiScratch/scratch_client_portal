class AddBiolinkInEventsUser < ActiveRecord::Migration

    def self.up
        add_column :events_users, :biolink, :string
        add_column :events_users, :start, :datetime
        add_column :events_users, :end, :datetime
    end
    
    def self.down
        remove_column :events_users, :biolink, :string
        remove_column :events_users, :start, :datetime
        remove_column :events_users, :end, :datetime
    end

end