class EventsController < ApplicationController
  filter_access_to :all

  def index
    @new_event_description = EventDescription.new
    @events = EventDescription.all
  end

  def events
    @event = EventDescription.find_by_id(params[:id])
    @has_sidebar = true
  end

  def destroy
    @event = EventDescription.find_by_id(params[:id])

    if @event.destroy
      flash[:notice] = "Event description has been deleted"
    else
      flash[:error] = "Could not delete event description"
    end

    redirect_to events_path
  end

  def rules
    @event = EventDescription.find_by_id(params[:id])
  end

  def settings
    @event = EventDescription.find_by_id(params[:id])
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

  def toggledisabled
    @event_description = EventDescription.find_by_id(params[:id])
    if @event_description.disabled.blank?
      @event_description.disabled = true
    else
      @event_description.disabled = !@event_description.disabled
    end
    @event_description.save

    render :text => nil
  end

end
