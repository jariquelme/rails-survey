class AddAliasToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :alias, :string, null: false
    add_index :users, :alias, unique: true
  end
end
