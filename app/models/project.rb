class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_many :assignments, through: :tasks
  has_many_attached :files, dependent: :destroy

  validates :name, :description, :due_date, presence: true
end
