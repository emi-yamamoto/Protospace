class RemovePrototypeIdFromImages < ActiveRecord::Migration
  def change
    remove_column :images, :prototype_id, :integer
  end
end
