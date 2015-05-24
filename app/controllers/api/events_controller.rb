class API::EventsController < ApplicationController
  
  skip_before_action :verify_authenticity_token


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

    @registered_application = RegisteredApplication.find_by(url: request.env['HTTP_ORIGIN'])

    if @registered_application

      @event = @registered_application.events.build(event_params)
      if @event.save
        render json: @event, status: :created
      else
        render @event.errors, status: :unprocessable_entity
      end
    
    else
      render json: "Unregistered application", status: :unprocessable_entity
    end
  end


  def event_params
    params.require(:event).permit(:name)
  end


end
