class API::EventsController < ApplicationController
  
  skip_before_action :verify_authenticity_token
  after_action :cors_set_access_control_headers

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Max-Age'] = "1728000"
  end

  def index
    @events = Event.all
    render json: @events, status: :ok
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
    render json: @event
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
