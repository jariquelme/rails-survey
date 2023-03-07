class CreateSurveyResponses < ActiveRecord::Migration[7.0]
  def change
    create_table :survey_responses do |t|
      t.references :user, null: false, foreign_key: true
      t.jsonb :response, default: {}
      t.date :date, null: false, index: true

      t.timestamps
    end
    add_index :survey_responses, [:user_id, :date], unique: true
  end
end
