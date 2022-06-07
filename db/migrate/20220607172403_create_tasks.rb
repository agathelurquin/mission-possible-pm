class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.string :status
      t.date :due_date
      t.datetime :completion_date
      t.float :estimated_effort
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
