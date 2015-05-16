class EventsController < ApplicationController
  def index
  end

  def new
    @event = Event.new
  end

  def show
  end

  def edit
  end

  def create
    @registered_application = RegisteredApplication.find(params[:id])
    @event = @registered_application.events.build(event_params)
    if @event.update_attributes(event_params)
      redirect_to @registered_application
    else
      flash[:error] = "Error updating registered application. Please try again."
      render :new
    end
  end

  def event_params
    params.require(:event).permit(:name)
  end


end
