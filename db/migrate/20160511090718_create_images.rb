class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
        t.integer     :status
        t.integer     :prototype_id

      t.timestamps
    end
  end
end
