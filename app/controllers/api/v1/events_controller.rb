class Api::V1::EventsController < ApplicationController
  
  def index
  end

  def create
  end

  def update
  end

  def show
  end

  def destroy
  end

  def find_by_event_code
    if event
      render json: event
    else
      render json: event.errors
    end
  end


  private

  def event
    event = params.has_key?(:event_code) ? Event.find_by(event_code: params[:event_code]) : Event.find(params[:id])
    @event ||= event
  end
end
