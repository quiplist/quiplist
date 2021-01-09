class SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token, only: [:create, :destroy]

  def create
    event = Event.find_by(event_code: params[:event_code])
    if event.nil?
      render json: event_not_found
    else
      self.resource = warden.authenticate!(auth_options)
      sign_in(resource_name, resource)
      yield resource if block_given?
      respond_with resource, location: after_sign_in_path_for(resource)
    end
  end

  private

  def respond_with(resource, _opts = {})
    render_jsonapi_response(resource)
  end

  def respond_to_on_destroy
    head :no_content
  end

end
