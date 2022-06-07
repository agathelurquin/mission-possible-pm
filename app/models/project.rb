class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_many :assignments, through: :tasks

  validates :name, :description, :deadline, presence: true

end
