class ChangeDataTypeForDaysRemaining < ActiveRecord::Migration
  def change
    change_table :records do |t|
      t.change :days_remaining, :float
    end
  end
end
