require 'test_helper'

class StreamTest < ActiveSupport::TestCase
  setup do
    @ed = EventDescription.make
  end

  should "not append disabled to title if description is not disabled" do
    @ed.disabled = false
    assert_equal @ed.title, @ed.title_possibly_disabled
  end

  should "append disabled to title if description is disabled" do
    @ed.disabled = true
    assert_equal @ed.title + " (disabled)", @ed.title_possibly_disabled
  end

end
