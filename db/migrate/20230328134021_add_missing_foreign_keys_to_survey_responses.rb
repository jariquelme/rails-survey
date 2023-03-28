class AddMissingForeignKeysToSurveyResponses < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :survey_responses, :departments, column: :department_id, validate: false
    add_foreign_key :survey_responses, :teams, column: :team_id, validate: false
  end
end
