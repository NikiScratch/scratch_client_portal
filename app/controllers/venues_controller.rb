class VenuesController < ApplicationController
  def index
    # if params [:user_id]
    #      @venues=Venues.where[venue.event.user_id]= params[:user_id]
    #  else
    #@venues=current_user.events.all
    #@venues=current_user.venues.all
    # @venues=Venue.all
    # end
  
  end

  def show
    @venue = Venue.find(params[:id])
  end
end