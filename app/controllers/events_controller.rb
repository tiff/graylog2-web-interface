class EventsController < ApplicationController
  filter_access_to :all

  def index
    @new_event_description = EventDescription.new
  end

  def create
    @event_description = EventDescription.new(params[:event_description])
    @event_description.disabled = true
    if @event_description.save
      flash[:notice] = "New event description has been created"
      redirect_to rules_event_path(@event_description)
    else
      flash[:error] = "Could not create event description"
      redirect_to events_path
    end
  end

  def rules
    @event = EventDescription.find(params[:id])
  end

end
