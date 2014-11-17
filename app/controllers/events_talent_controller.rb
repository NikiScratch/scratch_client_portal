class EventsTalentController < ApplicationController
  def index
    #@event = EventsTalent.find(params[:event_id])
    
  end

  def show
   @eventtalent = EventsTalent.all
  end
end