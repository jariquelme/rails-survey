class ValidateAddMissingForeignKeysToSurveyResponses < ActiveRecord::Migration[7.0]
  def change
    validate_foreign_key :survey_responses, :departments
    validate_foreign_key :survey_responses, :teams
  end
end
