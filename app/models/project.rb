class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_many :assignments, through: :tasks
  has_many_attached :files

  validates :name, :description, :due_date, presence: true

end
