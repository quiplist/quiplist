class ApplicationController < ActionController::Base
  respond_to :json

  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def render_not_found_response(exception)
    render json: { message: "Record Not Found", errors: exception.message }, status: :not_found
  end


  def render_unprocessable_entity_response(exeception)
    render json: { message: "Validation Failed", errors: ValidationErrorsSerializer.new(exception.record).serialize }, status: :unprocessable_entity
  end

  def render_jsonapi_response(resource, status=400)
    if resource.errors.empty?
      render json: resource, adapter: :json
    else
      render json: { error: resource.errors }, status: status
    end
  end

  protected

  def pagination(object)
    if object.empty?
      return {
        current_page: 0,
        next_page: 0,
        prev_page: 0,
        total_pages: 0,
        total_count: 0
      }
    end
    {
      current_page: object.current_page,
      next_page: object.next_page,
      prev_page: object.prev_page,
      total_pages: object.total_pages,
      total_count: object.total_count
    }
  end

  def find_event(event_code)
    event = Event.find_by(event_code: params[:event_code])
  end
end
