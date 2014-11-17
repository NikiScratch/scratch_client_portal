class RemoveFieldFromEvent < ActiveRecord::Migration
  def self.up
    remove_column :events, :user_id
  end

  def self.down
    add_column :events, :user_id, :integer
  end
end