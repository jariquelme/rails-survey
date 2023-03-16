class SurveyResponsesController < DashboardController
  def index
    @survey_responses = current_user.survey_responses.order(:created_at)
  end

  def show
    @survey_response = current_user.survey_responses.find(params[:id])
  end

  def new
  end
end
