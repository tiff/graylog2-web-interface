require 'test_helper'

class EventsControllerTest < ActionController::TestCase

  context "creating" do

    should "create and redirect" do
      assert_difference('EventDescription.count') do
        post :create, :event_description => { :title => 'foo' }
      end

      assert_nil flash[:error]
      assert_redirected_to rules_event_path(assigns(:event_description))
    end

    should "be disabled from the beginning" do
      post :create, :event_description => { :title => 'foo' }

      assert assigns(:event_description).disabled
      assert_nil flash[:error]
      assert_redirected_to rules_event_path(assigns(:event_description))
    end

    should "redirect to events index in case of error" do
      assert_no_difference('EventDescription.count') do
        post :create # no parameters
      end

      assert_not_nil flash[:error]
      assert_redirected_to events_path
    end

  end

end
