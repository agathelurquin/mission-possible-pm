class ChangeColumnProjects < ActiveRecord::Migration[6.1]
  def change
    change_column_default :projects, :status, "Open"
  end
end
