class EventsUserController < ApplicationController


  def index
    #@user = User.find(params[:user_id])
    @user=current_user
    @events = @user.events.where("date > ?", Date.yesterday)
    
  end

  def show
    @user=current_user
    @pastevents = @user.events.where("date < ?", Date.today)
  end

end