class RemoveUserIdFromPrototypes < ActiveRecord::Migration
  def change
    remove_column :prototypes, :user_id, :integer
  end
end
