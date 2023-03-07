class PagesController < ApplicationController
  def home
    @survey_responses = current_user.survey_responses.order(:created_at)
  end

  def survey
  end
end
