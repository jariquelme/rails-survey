class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :alias, null: false, unique: true
      t.boolean :anonymised, default: true

      t.references :user, null: false, foreign_key: true
      t.references :department, null: true, foreign_key: true
      t.references :team, null: true, foreign_key: true

      t.timestamps
    end
  end
end
