class GuestListsController < ApplicationController

  load_and_authorize_resource :event
  load_and_authorize_resource :guest_list, through: :event

  before_action :authenticate_user!

  def index
    page = params[:page] || 1
    per_page = params[:per_page] || 1
    search = params[:search]
    @events = @events.search(search) if search.present?
    @guest_lists = @guest_lists.accessible_by(current_ability).sorted.page(page).per(per_page)
  end

  def show
  end

  def new
  end

  def create
    if @guest_list.save
      redirect_to envent_guest_list_path(@guest_list), notice: "Raffle #{@guest_list.raffle_type} added successfully!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @guest_list.update_attributes guest_list_params
      redirect_to envent_guest_list_path(@guest_list), notice: "Raffle #{@guest_list.raffle_type} updated successfully!"
    else
      render :edit
    end
  end

  def destroy
    @guest_list.destroy
    redirect_to envent_guest_lists_path
  end

  private

  def guest_list_params
    params.require(:guest_list).permit(:raffle_type, :prize)
  end
end
