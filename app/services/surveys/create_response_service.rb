module Surveys
  class CreateResponseService < ApplicationService
    attr_reader :response
    attr_reader :owner_id

    def initialize(owner_id, response)
      @owner_id = owner_id
      @response = response
    end

    def call
      survey_response = SurveyResponse.new(
        response: @response,
        date: @response.dig(:whichDayDoYouWantToEvaluate),
        user_id: @owner_id
      )
      survey_response.save!
      survey_response
    end
  end
end

