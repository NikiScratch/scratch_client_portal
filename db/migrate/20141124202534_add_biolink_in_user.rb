class AddBiolinkInUser < ActiveRecord::Migration
    def self.up
        add_column :users, :biolink, :string
    end
    
    def self.down
        remove_column :users, :biolink, :string
        
    end
end
