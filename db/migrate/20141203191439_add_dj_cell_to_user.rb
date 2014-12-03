class AddDjCellToUser < ActiveRecord::Migration
    def self.up
        add_column :users, :dj_cellphone, :integer
    end

    def self.down
        remove_column :users, :dj_cellphone
    end
end
