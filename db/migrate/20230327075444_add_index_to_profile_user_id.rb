class AddIndexToProfileUserId < ActiveRecord::Migration[7.0]
  def change
    remove_index :profiles, :user_id
    add_index :profiles, :user_id, unique: true
  end
end
