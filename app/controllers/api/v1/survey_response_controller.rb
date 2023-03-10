class Api::V1::SurveyResponseController < ActionController::API
  before_action :authenticate_user!

  def create
    survey_response = Surveys::CreateResponseService.call(
      current_user.id,
      survey_response_params.dig(:response)
    )

    if survey_response.valid?
      redirect_to root_path
    else
      render json: response.errors
    end
  end

  private

  def survey_response_params
    params.require(:survey_response).permit(response: {})
  end
end