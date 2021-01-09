class ApplicationController < ActionController::Base
  respond_to :json
  #before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def not_found
    render json: {
      'errors': [
        {
          'status': '404',
          "message": 'Not Found'
        }
      ]
    }, status: 404
  end

  def render_jsonapi_response(resource)
    if resource.errors.empty?
      render json: resource, adapter: :json
    else
      render json: { error: resource.errors }, status: 400
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

  def event_not_found
    err = { 'errors': [
      {
        'status': '404',
        'event_code': 'Not Found'
      }
    ] }
  end

  # def configure_permitted_parameters
  #   added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
  #   devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  #   devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  # end
end
