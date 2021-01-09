class RegistrationsController < Devise::RegistrationsController
  skip_before_action :verify_authenticity_token, only: [:create]
  before_action :configure_permitted_parameters

  def create
    event = Event.find_by(event_code: params[:event_code])
    build_resource(sign_up_params)

    if event.nil?
      render json: event_not_found
    else
      if resource.save
        GuestList.create(user: resource, event: event)
      end
      sign_up(resource_name, resource) if resource.persisted?
      render_jsonapi_response(resource)
    end
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:email, :password, :password_confirmation, :event_code,
      :full_name, :birthdate, :contact_number, :member_type, :member_id, :affiliation]
    added_attrs -= [:event_code]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

end
