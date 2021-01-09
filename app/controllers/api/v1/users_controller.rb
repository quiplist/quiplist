class Api::V1::UsersController < ApplicationController
  load_and_authorize_resource :user

  def index
    page = params[:page] || 1
    per_page = params[:per_page] || 10
    search = params[:search]
    @users = @users.search(search) if search.present?
    @users = @users.accessible_by(current_ability).sorted.page(page).per(per_page)
    render json: @users,
           meta: { pagination: pagination(@users) },
           adapter: :json
  end

  def show
    render json: @user, adapter: :json
  end

  def create
    @user = User.new(resource_params)
    @user.password = @user.birthdate.strftime("%Y-%m-%d")
    @user.save
    render_jsonapi_response @user
  end

  def update
    @user.update_attributes resource_params
    render_jsonapi_response @user
  end

  def destroy
    @user.destroy
    render_jsonapi_response @user
  end

  def check_for_user
    if current_user.nil?
      unauthenticated_user
    else
      render json: current_user, adapter: :json
    end
  end

  private

  def resource_params
    ActiveModelSerializers::Deserialization.jsonapi_parse!(params, only: [:affiliation, :birthdate, :contact_number,
            :email, :full_name, :member_type, :role, :member_id])
  end

  def unauthenticated_user
    err = { 'errors': [
      {
        'status': '401',
        'message': 'unauthenticated user'
      }
    ] }
  end
end
