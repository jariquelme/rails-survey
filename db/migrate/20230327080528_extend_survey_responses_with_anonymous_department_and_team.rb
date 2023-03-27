class ExtendSurveyResponsesWithAnonymousDepartmentAndTeam < ActiveRecord::Migration[7.0]
  disable_ddl_transaction!

  def change
    add_reference :survey_responses, :department, null: true, index: { algorithm: :concurrently }
    add_reference :survey_responses, :team, null: true, index: { algorithm: :concurrently }

    add_column :survey_responses, :anonymised, :boolean, default: true
  end
end
