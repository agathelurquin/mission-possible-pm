class Task < ApplicationRecord
  belongs_to :project
  has_many :assignments, dependent: :destroy
  has_many :users, through: :assignments
  has_rich_text :notes

  validates :name, :description, :due_date, :estimated_effort, presence: true
  STATUS = ["Open", "In progress", "Completed", "Cancelled"]
end
