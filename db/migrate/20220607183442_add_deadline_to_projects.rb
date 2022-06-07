class AddDeadlineToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :deadline, :date
  end
end
