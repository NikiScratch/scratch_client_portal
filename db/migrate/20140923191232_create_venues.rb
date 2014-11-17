class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.integer :event_id
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip

      t.timestamps
    end
  end
end
