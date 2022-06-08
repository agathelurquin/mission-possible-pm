class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :projects, :deadline, :due_date
  end
end
