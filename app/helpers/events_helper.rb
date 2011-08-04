module EventsHelper

  def event_tabs
    tabs = Array.new
    
    if @event
    tabs.push ["Show", events_event_path(@event)] if permitted_to?(:events, :events)
    tabs.push ["Rules", rules_event_path(@event)] if permitted_to?(:rules, :events)
    tabs.push ["Settings", settings_event_path(@event)] if permitted_to?(:settings, :events)
    end

    return tabs
  end

end
