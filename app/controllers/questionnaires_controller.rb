class QuestionnairesController < ApplicationController

  load_and_authorize_resource :event
  load_and_authorize_resource :questionnaire, through: :event

  before_action :authenticate_user!

  def index
    page = params[:page] || 1
    per_page = params[:per_page] || 10

    @questionnaires = @questionnaires.accessible_by(current_ability).sorted.page(page).per(per_page)
  end

  def show
  end

  def new
  end

  def create
    if @questionnaire.save
      redirect_to questionnaire_path(@questionnaire), notice: "Questionnaire #{@questionnaire.question} added successfully!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @questionnaire.update_attributes questionnaire_params
      redirect_to event_questionnaire_path(@questionnaire), notice: "Questionnaire #{@questionnaire.question} updated successfully!"
    else
      render :edit
    end
  end

  def destroy
    @questionnaire.destroy
    redirect_to event_questionnaires_path
  end

  private

  def questionnaire_params
    params.require(:questionnaire).permit(:question, :answer, :choices, :questionnaire_type)
  end
end
