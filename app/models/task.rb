class Task < ApplicationRecord
  belongs_to :project
  has_many :assignments, dependent: :destroy

  validates :name, :description, :due_date, presence: true
end
