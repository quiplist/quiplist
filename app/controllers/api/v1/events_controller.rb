class Api::V1::EventsController < ApplicationController
  #before_action :authenticate_user!
  load_and_authorize_resource :event

  def index
    page = params[:page] || 1
    per_page = params[:per_page] || 10
    search = params[:search]
    @events = @events.search(search) if search.present?
    @events = @events.accessible_by(current_ability).sorted.page(page).per(per_page)
    render json: @events,
           meta: { pagination: pagination(@events) },
           adapter: :json
  end

  def show
    render json: @event, adapter: :json
  end

  def find_by_event_code
    @event = Event.find_by(event_code: params[:event_code])
    if @event.nil?
      render json: event_not_found, status: 400, adapter: :json
    else
      render json: @event, adapter: :json
    end

  end

  def create
    @event = Event.create(resource_params)
    render_jsonapi_response @event
  end

  def update
    @event.update_attributes resource_params
    render_jsonapi_response @event
  end

  def destroy
    @event.destroy
    render_jsonapi_response @event
  end

  def upload_brochure
    @event.brochure = params[:brochure]
    @event.save
    render_jsonapi_response @event
  end

  private

  def resource_params
    ActiveModelSerializers::Deserialization.jsonapi_parse!(params, only: [:title, :description, :event_code,
      :start_date, :end_date, :start_time, :end_time, :event_type, :stream_type, :stream_key, :stream_video])
  end

  def event_not_found
    err = { 'errors': [
      {
        'status': '400',
        'event_code': 'Not Found'
      }
    ] }
  end
end
