class RafflesController < ApplicationController

  load_and_authorize_resource :event
  load_and_authorize_resource :raffle, through: :event

  before_action :authenticate_user!

  def index
    page = params[:page] || 1
    per_page = params[:per_page] || 1
    @raffles = @raffles.accessible_by(current_ability).sorted.page(page).per(per_page)
  end

  def show
  end

  def new
  end

  def create
    if @raffle.save
      redirect_to envent_raffle_path(@raffle), notice: "Raffle #{@raffle.raffle_type} added successfully!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @raffle.update_attributes raffle_params
      redirect_to event_raffle_path(@raffle), notice: "Raffle #{@raffle.raffle_type} updated successfully!"
    else
      render :edit
    end
  end

  def destroy
    @raffle.destroy
    redirect_to event_raffles_path
  end

  private

  def raffle_params
    params.require(:raffle).permit(:raffle_type, :prize)
  end
end
