class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.integer :blood_type_id
      t.integer :days_remaining
      t.string :authority

      t.timestamps
    end
  end
end
