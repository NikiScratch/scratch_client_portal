class EventsUser < ActiveRecord::Base
    belongs_to :user
    belongs_to :event
    #has_many :events_venues, through: :events_venues
    #has_many :venues, through: :events_venues
   
end
