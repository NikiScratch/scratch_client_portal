class EventvenueController < ApplicationController
  def index

  end

  def show
  #? if model to UserEventVenue @user=User.find(params[:user_id]) or current_user.userevent_venues
    @venue = Venue.find(params[:venue_id])
    #Find events for user in venue
    @events = @venue.events_for_user(current_user.id).where("date >= ?", Date.today).order('date desc')
    #Find EventTalent where events is equal to @events
    @events_in_eventtalent= EventsTalent.where(event_id: @events)
    #get user ids from those events
    @user_id= EventsTalent.where(event_id: @events).pluck(:user_id)
    #Find those users in event talent
    User.find(@user_id)
  end
 
end