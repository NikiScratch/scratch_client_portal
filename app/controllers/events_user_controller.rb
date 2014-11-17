class EventsUserController < ApplicationController
  def index
    #@user = User.find(params[:user_id])
    @user=current_user
    @events = @user.events.where("date < ?", Date.today)
    
  end

  def show
  end

end