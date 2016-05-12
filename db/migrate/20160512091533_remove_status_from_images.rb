class RemoveStatusFromImages < ActiveRecord::Migration
  def change
    remove_column :images, :status, :integer
  end
end
