class EventSearchesController < ApplicationController
  before_action :set_event_search, only: [:show, :update, :destroy]

  # GET /event_searches
  def index
    @event_searches = EventSearch.all

    render json: @event_searches
  end

  # GET /event_searches/1
  def show
    render json: @event_search
  end

  # POST /event_searches
  def create
    @event_search = EventSearch.new(event_search_params)

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
      @event_search = EventSearch.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def event_search_params
      params.require(:event_search).permit(:source, :group, :event, :start_date, :start_time, :end_date, :end_time, :user_id)
    end
end
