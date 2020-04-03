require_relative('../../lib/debug_helper')
include DebugHelper
# changedoc - was class EventSearchesController < ApplicationController
# changedoc Decide between OpenRead and Protected
class EventSearchesController < ProtectedController #changedoc
  before_action :set_event_search, only: [:show, :update, :destroy]

  # GET /event_searches
  def index
    # changedoc for index method
    # changedoc was @event_searches = EventSearch.all
    @event_searches = current_user.event_searches.all #changedoc

    render json: @event_searches
  end

  # GET /event_searches/1
  def show
    render json: @event_search
  end

  # POST /event_searches
  def create
    # changedoc was @event_search = EventSearch.new(event_search_params)

    @event_search = current_user.event_searches.build(event_search_params) #changedoc
    if @event_search.save
      render json: @event_search, status: :created, location: @event_search
    else
      render json: @event_search.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /event_searches/1
  def update
    if @event_search.update(event_search_params)
      render json: @event_search
    else
      render json: @event_search.errors, status: :unprocessable_entity
    end
  end

  # DELETE /event_searches/1
  def destroy
    @event_search.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event_search
    # changedoc was @event_search = EventSearch.find(params[:id])
    @event_search = current_user.event_searches.find(params[:id]) #changedoc
  end

  # Only allow a trusted parameter "white list" through.
  def event_search_params
    puts '1',:source
    puts '2',:keyword
    puts '3',:start_date
    params.require(:event_search).permit(:source, :keyword, :start_date, :end_date, :start_time, :end_time)
  end
end
