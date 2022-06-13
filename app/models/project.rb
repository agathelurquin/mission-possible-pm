class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_many :assignments, through: :tasks
  has_one :chatroom, dependent: :destroy

  validates :name, :description, :due_date, presence: true

end
