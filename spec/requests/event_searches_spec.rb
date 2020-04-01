require 'rails_helper'

RSpec.describe "EventSearches", type: :request do
  describe "GET /event_searches" do
    it "works! (now write some real specs)" do
      get event_searches_path
      expect(response).to have_http_status(200)
    end
  end
end
