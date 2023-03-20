class RemoveAliasFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_index :users, :alias, if_exists: true
    remove_column :users, :alias
  end
end
