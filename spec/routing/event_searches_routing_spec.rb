require "rails_helper"

RSpec.describe EventSearchesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/event_searches").to route_to("event_searches#index")
    end


    it "routes to #show" do
      expect(:get => "/event_searches/1").to route_to("event_searches#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/event_searches").to route_to("event_searches#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/event_searches/1").to route_to("event_searches#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/event_searches/1").to route_to("event_searches#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/event_searches/1").to route_to("event_searches#destroy", :id => "1")
    end

  end
end
