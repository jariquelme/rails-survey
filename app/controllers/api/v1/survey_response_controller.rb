class Api::V1::SurveyResponseController < ActionController::API
  before_action :authenticate_user!

  def create
    response = transform(survey_response_params.dig(:response).to_h)
    date = response.dig(:which_day_do_you_want_to_evaluate)

    survey_response = Surveys::CreateResponseService.call(
      date,
      current_user.id,
      current_user.profile.department_id,
      current_user.profile.team_id,
      current_user.profile.anonymised,
      response
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

  def transform(response)
    response.deep_transform_keys(&:underscore)
  end
end