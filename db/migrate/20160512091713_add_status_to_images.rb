class AddStatusToImages < ActiveRecord::Migration
  def change
    add_column :images, :status, :integer, default: 0, null: false, limit: 1
  end
end
