class AddCompletionDateToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :completion_date, :date
  end
end
