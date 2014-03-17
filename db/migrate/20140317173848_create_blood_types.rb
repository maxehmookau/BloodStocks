class CreateBloodTypes < ActiveRecord::Migration
  def change
    create_table :blood_types do |t|
      t.string :letter
      t.boolean :positive, default: true

      t.timestamps
    end
  end
end
