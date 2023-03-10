class Api::V1::SurveyResponseController < ActionController::API
  before_action :authenticate_user!

  def create
    params = survey_response_params
    response = current_user.survey_responses.new(params)
    response.date = params.dig(:response, :whichDayDoYouWantToEvaluate)

    if response.save!
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