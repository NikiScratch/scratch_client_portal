class Venue < ActiveRecord::Base
    has_many :events, through: :events_venues
    has_many :events_venues, dependent: :destroy
    has_many :users, through: :events
    has_many :events_users, through: :events
    
    #finds events specific to current user
    def events_for_user (user_id)
        events_users.includes(:event).where("events_users.user_id=?",user_id)
    end
end