class SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token, only: [:create, :destroy]

  def create
    is_admin = params[:is_admin] || false

    if is_admin
      self.resource = warden.authenticate!(auth_options)
      sign_in(resource_name, resource)
      yield resource if block_given?
      respond_with resource, location: after_sign_in_path_for(resource)
    else
      event = find_event(params[:event_code])
      puts "================= #{event.inspect}"
      raise ActiveRecord::RecordNotFound.new("not found") if event.nil?
      puts "====== inside else"
      self.resource = warden.authenticate!(auth_options)
      puts "=========== #{resource}"
      
      puts "=========== #{resource_name}"
      sign_in(resource_name, resource)
      puts "=========== #{block_given?}\n\n"
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
