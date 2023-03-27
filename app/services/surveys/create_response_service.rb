module Surveys
  class CreateResponseService < ApplicationService
    attr_reader :response
    attr_reader :owner_id
    attr_reader :department_id
    attr_reader :team_id
    attr_reader :anonymised

    def initialize(owner_id, department_id, team_id, anonymised, response)
      @owner_id = owner_id
      @department_id = department_id
      @team_id = team_id
      @anonymised = anonymised
      @response = response
    end

    def call
      survey_response = SurveyResponse.new(
        response: @response,
        date: @response.dig(:whichDayDoYouWantToEvaluate),
        user_id: @owner_id,
        department_id: @department_id,
        team_id: @team_id,
        anonymised: @anonymised
      )
      survey_response.save!
      survey_response
    end
  end
end

