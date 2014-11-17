class CreateEventsUsers < ActiveRecord::Migration
  def change
    create_table :events_users do |t|
      t.integer :user_id
      t.integer :event_id
      t.string :type

      t.timestamps
    end

    User.all.each do |u|
        u.events.each do |e|
            EventsUser.create(user_id: u.id, event_id: e.id, type: "EventsClient")
        end
    end


  end
end