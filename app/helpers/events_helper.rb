module EventsHelper

  def event_tabs
    tabs = Array.new
    tabs.push ["Show", events_event_path(@event_description)] if permitted_to?(:events, @event_description)
    tabs.push ["Rules", rules_event_path(@event_description)] if permitted_to?(:rules, @event_description)
    tabs.push ["Settings", settings_event_path(@event_description)] if permitted_to?(:settings, @event_description)

    return tabs
  end

end
