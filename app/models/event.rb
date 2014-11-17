class Event < ActiveRecord::Base
    has_many :events_users, dependent: :destroy
    has_many :users, through: :events_users
    has_many :events_venues, dependent: :destroy
    has_many :venues, through: :events_venues

    has_many :events_talents, class_name: "EventsTalent"
    has_many :talents, through: :events_talents, source: :user
    has_many :events_clients, class_name: "EventsClient"
    has_many :clients, through: :events_clients, source: :user

    def djnames
        names = ""
        talents.each do |talent|
            talent.name
            names= names+"#{talent.name}"
        end
    end
end