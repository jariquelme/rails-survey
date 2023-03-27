class AddIndexToSurveyResponsesResponse < ActiveRecord::Migration[7.0]
  def change
    add_index :survey_responses, :response, using: :gin
  end
end
