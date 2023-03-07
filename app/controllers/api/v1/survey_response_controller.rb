class Api::V1::SurveyResponseController < ActionController::API
  before_action :authenticate_user!

  def create
    response = current_user.survey_responses.create!(survey_response_params)
    if response
      redirect_to root_path
    else
      render json: response.errors
    end
  end

  private

  def survey_response_params
    params.require(:survey_response).permit(:date, response: {})
  end
end