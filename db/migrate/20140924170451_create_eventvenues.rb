class CreateEventvenues < ActiveRecord::Migration
  def change
    create_table :eventvenues do |t|
      t.integer :venue_id
      t.integer :event_id

      t.timestamps
    end
  end
end
