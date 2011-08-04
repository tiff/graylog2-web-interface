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

  context "deleting" do

    should "delete a stream" do
      ed = EventDescription.make

      assert_difference('EventDescription.count', -1) do
        delete :destroy, :id => ed.id.to_param
      end
    end

  end

  context "enabling and disabling" do

    should "disable an event that has no disabled attribute yet" do
      ed = EventDescription.make(:disabled => nil)
      post :toggledisabled, :id => ed.id.to_param

      assert assigns(:event_description).disabled
    end

    should "disable an event that is enabled" do
      ed = EventDescription.make(:disabled => false)
      post :toggledisabled, :id => ed.id.to_param

      assert assigns(:event_description).disabled
    end

    should "enable an event that is disabled" do
      ed = EventDescription.make(:disabled => true)
      post :toggledisabled, :id => ed.id.to_param

      assert !assigns(:event_description).disabled
    end

  end

  context "renaming" do
    should "reaname an event" do
      new_title = "new title"
      ed = EventDescription.make(:title => "ZOMG EVENT")
      post :rename, :id => ed.id.to_param, :title => new_title

      assert_equal new_title, assigns[:event].title
      assert_nil flash[:error]
      assert_redirected_to settings_event_path(assigns(:event))
    end
  end

end
