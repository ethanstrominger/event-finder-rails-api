# frozen_string_literal: true

require 'rails_helper'

require 'requests/auth_helper'

# require 'debug_helper'
# include DebugHelper

RSpec.configure do |c|
  c.include AuthHelper
end

RSpec.describe 'EventSearchs', type: :request do
  before(:all) do
    EventSearch.delete_all
    User.delete_all
    signup_and_in
  end

  after(:all) do
    EventSearch.delete_all
    User.delete_all
  end
  sample_date = '2020-12-25'
  event_search_params1 = { source: 'Meetup', keyword: 'python', start_date: sample_date }
  event_search_params2 = { source: 'Meetup', keyword: 'knitting', start_date: sample_date }
  event_search_params3 = { source: 'Meetup', keyword: 'tech', start_date: sample_date }
  new_values = { source: 'Meetup', keyword: 'tech', start_date: sample_date }

  def event_searches
    EventSearch.all
  end

  def event_search_first
    EventSearch.first
  end

  def event_search_last
    EventSearch.last
  end

  before(:all) do
    signup_and_in
    post '/event_searches', params: { event_search: event_search_params1 }, headers: headers
    post '/event_searches', params: { event_search: event_search_params1 }, headers: headers
    post '/event_searches', params: { event_search: event_search_params1 }, headers: headers
  end

  after(:all) do
    EventSearch.delete_all
  end

  describe 'GET /event_searches' do
    it 'lists all event_searches' do
      get '/event_searches', headers: headers
      expect(response).to be_success
      event_searches_response = JSON.parse(response.body)
      expect(event_searches_response["event_searches"].length).to eq(event_searches.count)
      expect(event_searches_response["event_searches"].first['title']).to eq(event_search_first['title'])
    end
  end

  describe 'GET /event_searches/:id' do
    it 'shows one event_search' do
      event_search_id = event_search_first['id']
      get "/event_searches/#{event_search_id}", headers: headers
      expect(response).to be_successful

      json_response = JSON.parse(response.body)
      event_search_response = json_response['event_search']

      expect(event_search_response['id']).not_to be_nil
      expect(event_search_response['title']).to eq(event_search_first['title'])
    end
  end

  describe 'DELETE /event_searches/:id' do
    it 'deletes an event_search' do
      last_id = event_search_last['id']
      delete "/event_searches/#{last_id}", headers: headers
      expect(response).to be_successful
      event_search_exists = EventSearch.exists?(last_id)
      expect(event_search_exists).to eq(false)
    end
  end

  describe 'PATCH /event_searches/:id' do
    def event_search_diff
      { title: 'Updaded event_search, only title updated' }
    end

    it 'updates an event_search' do
      last_id = event_search_last['id']
      patch "/event_searches/#{last_id}",
         params: { event_search: event_search_diff },
         headers: headers
      expect(response).to be_successful
    end
  end

  describe 'POST /event_searches' do
    it 'creates an event_search' do
      post '/event_searches', params: { event_search: new_values }, headers: headers
      expect(response).to be_successful
      last_record = EventSearch.last
      expect(last_record['title']).to eq(new_values[:title])
    end
  end
end
